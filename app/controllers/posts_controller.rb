class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
  end

  def show

  end
end
