class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]
  before_action :fuzzy_search, only: [:index, :search]

  def index
    @posts = Post.includes(:user).order("id DESC").page(params[:page]).per(6)
    gon.bird_list = BirdList.all
    respond_to do |format|
      format.html
      format.js
    end
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
    @comments = @post.comments.includes(:user).order('id DESC').page(params[:page]).per(5)
    @notice = Comment.where(['post_id = ? AND advice = ?', params[:id], 1]).first
  end

  def edit
    
  end

  def update
    @post.update(post_params) if @post.user_id == current_user.id
  end

  def destroy
    @post.destroy if @post.user_id == current_user.id
  end

  def search
    @search = Post.where('name LIKE ?', "%#{params[:keyword]}%").order('id DESC').page(params[:page]).per(999)
    respond_to do |format|
      format.html
      format.json
    end
    @typed_keyword = params[:keyword]
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
      #@search = []
      #split_keyword = params[:keyword]&.split(/[[:blank:]]+/)
      #split_keyword&.each do |keyword|
      #  next if keyword == ""
      #  @search = Post.where('name LIKE(?)', "%#{keyword}%")
      #end
      
      #@search&.uniq!
      
      #binding.pry
    end

    def post_params
      params.require(:post).permit(:name, :photo, :date, :location, :description, map_attributes: [:latitude, :longitude]).merge(user_id: current_user.id)
    end

end
