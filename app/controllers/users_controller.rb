class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find_by(id: params[:id])
    @posts = current_user.posts.all.order('created_at DESC').page(params[:page]).per(6)
  end

end