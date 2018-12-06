class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @tip = Tip.find(params[:tip_id])
    @comment = @tip.comments.create(comment_params)
    redirect_to tip_path(@tip)
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :tips_id).merge(user_id: current_user.id)
  end

end
