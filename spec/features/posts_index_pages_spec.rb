require "rails_helper"

RSpec.feature "post index page", :type => :feature do
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
    visit user_posts_path(@user)
  
  end

  scenario "can see the username" do
    expect(page).to have_content(@user.name)
  end

  scenario "can see all posts" do
    expect(page).to have_content('post 4')
    expect(page).to have_content('post 3')
    expect(page).to have_content('post 2')
    expect(page).to have_content('post 1')
  end

  scenario "can see the photo" do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end
  
  scenario "can see the number of posts" do
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end
  scenario "can see the number of comments" do
    expect(page).to have_content("Comments: #{@post.comments_count}")
  end
  scenario "can see the number of likes" do
    expect(page).to have_content("Likes: #{@post.likes_count}")
  end
  scenario "can see the post title" do
    expect(page).to have_content("post 4")
  end

  scenario "can see the first comment on post" do
    expect(page).to have_content(@comment.text)
  end

  scenario "click one post, redirect to users post show page" do
       click_link('post 4')
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
  end
end