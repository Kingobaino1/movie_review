class FollowingsController < ApplicationController
  def create
    @follow = current_user.active_followings.build(follows_params)
    if @follow.save
      @user = User.find(params[:followed_id])
      redirect_to user_path(@user)
    else
      flash[:alert] = 'You are not following this user'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @unfollows = current_user.following.delete(@user)
    redirect_to user_path(@user.id)
  end

  private

  def follows_params
    params.permit(:followed_id)
  end
end
