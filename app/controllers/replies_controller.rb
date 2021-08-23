class RepliesController < ApplicationController  

  def create
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.create(reply_params.merge(user_id: current_user.id))
    redirect_to root_path
  end
  
  def edit
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      redirect_to root_path
    end
  end
  
  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
    @reply.destroy
    redirect_to root_path
  end

  private
    def reply_params
      params.require(:reply).permit(:title, :body)
    end
end
