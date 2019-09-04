class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = 'yayyy'
      # flash[:notice] = 'good job'
      redirect_to @question

    else
      flash[:error] = @question.errors.full_messages.to_sentence
      # flash.now[:error] = "you forgot something"
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
