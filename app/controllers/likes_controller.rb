class LikesController < ApplicationController
  def create
    @like = Like.new
    @post = Post.find(params[:id])
    @like.post = @post
    @like.author = current_user
    @like.save
    if @like.save
        redirect_to user_post_path, notice: "You liked this post!"
    else
        redirect_to user_post_path, alert: "Error occured. Could not like this post"
    end
  end
end
