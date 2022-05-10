class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
  end

  def show
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
    @comments = @post.comments
  end
end
