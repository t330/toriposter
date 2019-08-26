class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to root_path
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[@post.id])
    end

end