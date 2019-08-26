class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  #before_action :check_correct_user, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :fuzzy_search, only: [:index, :search]

  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
    post_params
      # photo: post_params[:photo],
      # name: post_params[:name],
      # date: Date.new(post_params["date(1i)"].to_i, post_params["date(2i)"].to_i, post_params["date(3i)"].to_i),
      # location: post_params[:location],
      # user_id: current_user.id
    )
    @post.save
  end

  def show
    @co = Comment.new
  end

  def edit
    
  end

  def update
    post = @post
    post.update(post_params)
  end

  def destroy
    post = @post
    post.destroy
  end

  def search
    @typed_keyword = params[:keyword]
    @total_amount = @search.total_count
    @displayed_amount = @search.length
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    #def check_correct_user
    #  if @post.user_id != current_user.id then
    #    redirect_to root_path
    #  end
    #end

    def fuzzy_search
      @search = Post.where('name LIKE(?)', "%#{params[:keyword]}%").order('created_at DESC').page(params[:page]).per(6)
    end

    def post_params
      params.require(:post).permit(:name, :photo, :date, :location).merge(user_id: current_user.id)
      #API導入時にrequire(:post)をつける
    end

end
