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

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.save
      if @post.save
        redirect_to current_user_path, notice: "Post has been created successfully"
      else
        render :new, notice: "Post could not be created"
      end
  end


  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
