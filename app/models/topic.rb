class Topic < ApplicationRecord
  has_many :questions

  public
  def self.get_first(topic_name)
    @Topics = Topic.where(name: topic_name).pluck(:id)
    @Questions = Question.order("RANDOM()").limit(1).where(topic_id: @Topics[0])
  end
  def self.get_base(topic_name,answers)
    @Result = get_qbase(topic_name, answers)
  end
  def self.add_session_data(question_id,answer_input,importance,session_data)
    session_data[0].push(question_id)
    session_data[1].push(answer_input)
    session_data[2].push(importance)
    return session_data
  end
  def self.get_response(params,topic_name,answers)
    candidate_percentage = calc_percentage(params)
    p max_percentage = get_max_percentage(candidate_percentage)
    if max_percentage[:rmatch_index] > 50
      match = User.where(id: max_percentage[:nid])
      other_matches = get_other_match(candidate_percentage)
      @next = get_qbase(topic_name, answers)
      return {'session_data': params,'Type':'Answer', 'response': {Best_match: {name: match.pluck(:name)[0], party: match.pluck(:party)[0], photo: match.pluck(:picture)[0], rmatch_index: max_percentage[:rmatch_index] }, other_matches: other_matches}, keep_going: @next}
    else
      @Result = get_qbase(topic_name, answers)
      return {'session_data': params,'Type':'question', 'response': @Result}
    end
  end
  private
  def self.get_other_match(input)
    @others = input #.delete_at()
    @ret_others = Array.new
    if @others.count < 5
      i = @others.count
    else
      i = 5
    end
    for j in 0..(i-2)
      max_p = get_max_percentage(@others)
      @others.delete_at(max_p[:index])
      max_percentage = get_max_percentage(@others)
      match = User.where(id: max_percentage[:nid])
      @ret_others.push({name: match.pluck(:name)[0],rmatch_index: max_percentage[:rmatch_index]})

    end

    return @ret_others
  end
  def self.get_max_percentage(percent_array)
    p percent_array
    p maxval = percent_array[0][1]
    maxin = 0
    for i in 0..(percent_array.count - 1)
      p percent_array[i][1]
      if percent_array[i][1] > maxval
        maxval = percent_array[i][1]
        maxin = i
      end
    end
    return { nid: percent_array[maxin][0], rmatch_index: percent_array[maxin][1], index: maxin}
  end
  def self.get_qbase(topic_name,answers)
    #@Questions = Question.order("RANDOM()").limit(1).where(topic_id: @Topics[0])
    @Topics = Topic.where(name: topic_name).pluck(:id)
    @Questions = Question.order("RANDOM()").limit(1).where(topic_id: @Topics[0])
    @Questions =@Questions.where.not(id: answers[0])
  end
  def self.calc_percentage(session_data)
    @usrhash = Array.new
    @Candidates = User.order(id: :asc).all
    @Candidates.each_with_index do |usuario, j|
        @usrhash.push([usuario[:id]])
        percentage = 50
        for i in 0..(session_data[0].count - 1)
           session_data[2][i].to_i
          #p " candidate answer #{Hash[*usuario[:dataset].flatten(1)][session_data[0][i].to_s].to_i}, #{session_data[1][i]} to question #{session_data[0][i].to_s}"
           if Hash[*usuario[:dataset].flatten(1)][session_data[0][i].to_s].to_i == session_data[1][i].to_i
             percentage = ((100/(session_data[0].count)) * (2.to_f/session_data[2][i].to_i)).ceil  + percentage
          else
             percentage = percentage - ((100/(session_data[0].count)) * (1.to_f/session_data[2][i].to_i)).ceil
          end
        end
        @usrhash[j].push(percentage)
    end
    return @usrhash

  end
end
