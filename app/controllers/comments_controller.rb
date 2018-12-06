class CommentController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = @tip.comment.create(comment_params)
  end

  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :tips_id)
  end
