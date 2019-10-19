class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]
  before_action :fuzzy_search, only: [:index, :search]

  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(6)
    #@a = @posts.prefecture.name
    #@aaa = Post.find(2)
  end

  def new
    @post = Post.new
    @map = @post.build_map
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

  def show
    @post_lat = @post.map.latitude
    @post_lng = @post.map.longitude
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order('created_at DESC').page(params[:page]).per(5)
  end

  def edit
    
  end

  def update
    @post.update(post_params)
  end

  def destroy
    @post.destroy
  end

  def search
    @typed_keyword = params[:keyword]
    @total_amount = @search.total_count
    @displayed_amount = @search.length
  end

  def bird
    @name = params[:bird]
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def check_correct_user
      redirect_to root_path unless user_signed_in? && (@post.user.id == current_user.id)
    end

    def fuzzy_search
      @search = Post.where('name LIKE(?)', "%#{params[:keyword]}%").order('created_at DESC').page(params[:page]).per(6)
    end

    def post_params
      params.require(:post).permit(:name, :photo, :date, :location, :description, map_attributes: [:latitude, :longitude]).merge(user_id: current_user.id)
    end

end
