class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts

  end

  def search
    @users = User.where("username LIKE ?", "%" + params[:q] + "%")
  end

end
