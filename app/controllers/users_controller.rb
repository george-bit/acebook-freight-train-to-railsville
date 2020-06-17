class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts

  end

end
