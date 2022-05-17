require "rails_helper"

RSpec.feature "post show page", :type => :feature do
  before(:each) do
    @user = User.create(name: 'Bertrand',
                        photo: 'https://randomuser.me/api/portraits/men/87.jpg',
                        bio: 'full stack developer',
                        posts_count: '1',
                        email: 'bertrand@example.com',
                        password: 'password')

    posts = ['post 1', 'post 2', 'post 3', 'post 4']
    posts.each do |post|
        @user.posts.create(title: post, text: 'this is the beginning')
    end
    @post = @user.posts.find_by(title: 'post 4')
    @comment = Comment.new(text: 'Wow!!')
    @comment.post = @post
    @comment.author = @user
    @comment.save
    login_as(@user)
    visit user_post_path(@user, @post)
  
  end

  scenario "can see the post author" do
    expect(page).to have_content(@post.author.name)
  end

  scenario "can see the number of comments" do
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end
  scenario "can see the number of likes" do
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
  scenario "can see the post title" do
    expect(page).to have_content(@post.title)
  end
  scenario "can see the post body text" do
    expect(page).to have_content(@post.text)
  end

  scenario "can see the first comment author on post" do
    expect(page).to have_content(@comment.author.name)
  end

  scenario "can see the first comment text on post" do
    expect(page).to have_content(@comment.text)
  end
end