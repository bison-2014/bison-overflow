class QuestionsController < ActionController::Base

  def index
    @questions = Question.all
    render :'questions/index'
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:errors] = "oopsies"
      redirect_to :back
    end
  end

  def new
    @thing = Question.new
    render :"questions/new"
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
