class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.includes(:opinions)
    @user = current_user
    @opinion = Opinion.new
    @opinions = Opinion.all
  end

  def show
    @user = User.includes(:opinions).find(params[:id])
    @follows = Following.new
    @current_user = current_user
  end
end

