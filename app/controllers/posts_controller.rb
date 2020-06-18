# frozen_string_literal: true

# posts controller
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index], only: [:new, :vote]
  before_action :set_post, only: [:vote]
  respond_to :js, :json, :html

  load_and_authorize_resource
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    @users = User.all
  end

  def update
    @post = Post.find(params[:id])
    @posts = Post.all

    if @post.validate_is_editable
      render 'edit'

    elsif @post.update(post_params)
      redirect_to posts_path

    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
