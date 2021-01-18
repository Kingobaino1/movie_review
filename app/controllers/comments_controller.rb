class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @opinion = @comment.opinion_id
    if @comment.save
      flash[:success] = 'Comment added'
    else
      flash[:danger] = 'Comment not added'
    end
    redirect_to opinion_path(@opinion)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :opinion_id, :rating)
  end
end
