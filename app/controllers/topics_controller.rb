class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /topics/1
  def show
    render json: @topic
  end

  def start
    @Q = Question.first
    p decoded_param = URI.decode(params[:rmatch])
    p decoded_param_json = JSON.parse(decoded_param, :symbolize_names => true)
    # This is where the first questions are asked we need at least N number of questions to be answered first
    if decoded_param_json[:session_data][0].count > 4
      @session_data = Topic.add_session_data(decoded_param_json[:question_id],decoded_param_json[:answer_input],decoded_param_json[:importance], decoded_param_json[:session_data])
      @response = Topic.get_response(@session_data,decoded_param_json[:topic_name],decoded_param_json[:session_data])
      render json: @response
    elsif decoded_param_json[:session_data][0].count > 0
      @session_data = Topic.add_session_data(decoded_param_json[:question_id],decoded_param_json[:answer_input],decoded_param_json[:importance], decoded_param_json[:session_data])
      @response = Topic.get_base(decoded_param_json[:topic_name],decoded_param_json[:session_data])
      render json: {'session_data': @session_data,'Type':'question', 'response': @response}
    else
      if decoded_param_json[:question_id] == nil
        @response = Topic.get_first(decoded_param_json[:topic_name])
        render json: {'session_data':decoded_param_json[:session_data],'Type':'question', 'response': @response}
      else
        @session_data = Topic.add_session_data(decoded_param_json[:question_id],decoded_param_json[:answer_input],decoded_param_json[:importance], decoded_param_json[:session_data])
        @response = Topic.get_base(decoded_param_json[:topic_name],decoded_param_json[:session_data])
        render json: {'session_data': @session_data,'Type':'question', 'response': @response}
      end
    end


  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

    # Only allow a trusted parameter "white list" through.
    def topic_params
      params.require(:topic).permit(:name)
    end
end
