class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.all.order('id DESC').page(params[:page]).per(6)
  end

end