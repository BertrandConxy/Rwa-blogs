class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:id])
    @comment.post = @post
    @comment.author = current_user
    @comment.save
    if @comment.save
        redirect_to user_post_path, notice: "Comment has been added successfully"
    else
        render :new, notice: "Comment could not be created"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
