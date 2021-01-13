class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @opinion = Opinion.new
    @opinions = Opinion.all
    
  end

  def show
    @user = User.find(params[:id])
    @follows = Following.new
    @current_user = current_user
    @unfollows
  end
end
