class PostsController < ApplicationController

  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @post1 = @post.photo
  end

  def update
  
  end

  def create
    binding.pry
    data = Post.new(photo: post_params[:photo], name: post_params[:name], date: post_params[:date], location: post_params[:location], user_id: current_user.id)
    data.save
  end

  def mypage
    @posts = Post.where(user_id: current_user.id).order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:photo, :name, :date, :location, :user_id)
  end

end
