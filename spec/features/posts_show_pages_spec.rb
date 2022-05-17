require 'rails_helper'

RSpec.feature 'post show page', type: :feature do
  before(:each) do
    img = 'https://randomuser.me/api/portraits/men/87.jpg'
    @user = User.create(name: 'Bertrand', photo: img, bio: 'full stack developer', posts_count: '1',
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
  scenario 'can see the post author, title, text' do
    expect(page).to have_content(@post.author.name)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
  end
  scenario 'can see the number of comments and likes' do
    expect(page).to have_content("Comments: #{@post.comments_count}")
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
  scenario 'can see the first comment author and text on post' do
    expect(page).to have_content(@comment.author.name)
    expect(page).to have_content(@comment.text)
  end
end
