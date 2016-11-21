class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    @questions = Question.where(topic_id: params[:topic_id])
    # p @questions.answers.to_a
    # Array.
    # p @questions
    # @questions.each_with_index do |q, i|
    #   q.answers = JSON.parse(q.answers)
    #   p @questions[i].answers
    #   p JSON.parse(@questions[i].answers)
    # end
    # @questions.map! { |q| q.answers = JSON.parse(q.answers) }
    render json: {
        x: @questions.map { |q| {
            id: q.id,
            answers: JSON.parse(q.answers),
            }
        }
        # id: @questions.id,
        # answers: JSON.parse(@questions.answers)
    }
    # render json: @questions
               # @questions
  end

  # GET /questions/1
  def show
    render json: @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:question, :instance_id)
    end
end
