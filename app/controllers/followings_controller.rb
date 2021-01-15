class FollowingsController < ApplicationController
  def create
    @follow = current_user.active_followings.build(follows_params)
    if @follow.save
      @user = User.find(params[:followed_id])
      flash[:success] = "You are now following #{@user.full_name}"
      redirect_to user_path(@user)
    else
      flash[:alert] = 'You are not following this user'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @unfollows = current_user.following.delete(@user)
    flash[:success] = "You are no longer following #{@user.full_name}"
    redirect_to user_path(@user.id)
  end

  private

  def follows_params
    params.permit(:followed_id)
  end
end
