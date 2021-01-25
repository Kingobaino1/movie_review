class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:success] = 'Review created!'
    else
      flash[:danger] = 'Your review was not submited. Fields with * are required'
    end
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @opinion = Opinion.includes(:comments).find(params[:id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content, :image, :title, :rating, :genre)
  end
end
