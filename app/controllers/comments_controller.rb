class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def new
    @commentable = find_commentable
    @comment = Comment.new
  end


  def create
    @commentable = find_commentable
    @comment = @commentable.comments.create(comment_params)
    if @comment
      redirect_to :id => nil
    else
      render :action => 'new'
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
        nil
      end
    end
end
