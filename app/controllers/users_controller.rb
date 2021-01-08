class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @opinion = Opinion.new
    @opinions = Opinion.all
  end
end
