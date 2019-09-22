class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @post = params[:post_id]
  end

  def edit
    
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

    def set_comment
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
    end

    def check_correct_user
      redirect_to root_path unless user_signed_in? && (@comment.user.id == current_user.id)
    end

    def comment_params
      params.require(:comment).permit(:content, :advice).merge(user_id: current_user.id, post_id: params[:post_id])
    end

end