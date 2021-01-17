class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment added'
    else
      flash[:alert] = 'Comment not added'
    end
    redirect_to root_path
  end
  private

  def comment_params
    params.require(:comment).permit(:content, :opinion_id)
  end
end
