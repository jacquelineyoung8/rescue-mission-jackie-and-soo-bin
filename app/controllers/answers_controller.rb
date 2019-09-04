class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answers = @question.answers

    if @answer.save
      flash[:notice] = 'Thanks'
      redirect_to question_path(@question)

    else
      flash.now[:error] = "Blah"
      render "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
