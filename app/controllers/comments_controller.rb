class CommentsController < ApplicationController

  def create
    @trend = Trend.find(params[:trend_id])
    @comment = @trend.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :trend_id, :body)
  end

end
