class PostsController < ApplicationController
  def index
    @author = User.find(params[:user_id])
    @author_posts = @author.posts.includes(:comments)
  end

  def show
    @author = User.find(params[:user_id])
    @author_posts = @author.posts
    @post = @author_posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.save
    if @post.save
      redirect_to user_path(params[:user_id]), notice: 'Post has been created successfully'
    else
      render :new, alert: 'Post could not be created'
    end
  end

  def destroy
    @author = User.find(params[:user_id])
    @post = @author.posts.find(params[:id])
    @post.destroy
    if @post.destroy
      redirect_to user_path(params[:user_id]), notice: 'Post has been deleted successfully'
    else
      redirect_to user_post_path(params[:user_id], params[:id]), alert: 'Post could not be deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
