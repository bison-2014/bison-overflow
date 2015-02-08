class QuestionsController < ApplicationController

  def index
    @thing = Question.new
    @questions = Question.all
  end

  def create
    @user = User.find(session[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:errors] = "oopsies"
      redirect_to :back
    end
  end

  def new
    @thing = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :all_tags)
  end

end
