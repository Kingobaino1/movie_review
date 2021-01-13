class FollowingsController < ApplicationController
  def create
    @follow = current_user.active_followings.build(follows_params)
    if @follow.save
      flash[:success] = 'You have started following this user!'
      redirect_to root_path
    else
      flash[:alert] = 'Your review was not submited'
    end

    def destroy
      @unfollows = Following.find_by(followed_id: @user.id).destroy
    end
  end

private

def follows_params
  params.permit(:followed_id)
end
end
