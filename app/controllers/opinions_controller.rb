class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:success] = 'Review created!'
      redirect_to root_path
    else
      flash[:alert] = 'Your review was not submited'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:content, :image, :title, :rating, :genre)
  end
end
