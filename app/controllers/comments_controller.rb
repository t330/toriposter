class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    @post = params[:post_id]
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :advice).merge(user_id: current_user.id, post_id: params[:post_id])
    end

end