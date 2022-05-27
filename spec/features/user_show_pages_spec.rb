require 'rails_helper'

RSpec.feature 'user show page', type: :feature do
  before(:each) do
    img = 'https://randomuser.me/api/portraits/men/87.jpg'
    @user = User.create(name: 'Bertrand', photo: img, bio: 'full stack developer', posts_count: '1',
                        email: 'bertrand@example.com',
                        password: 'password')
    posts = ['post 1', 'post 2', 'post 3', 'post 4']
    posts.each do |post|
      @user.posts.create(title: post, text: 'this is the beginning')
    end
    login_as(@user)
    visit user_path(@user)
  end
  scenario 'can see the username, photo and bio, number of posts' do
    expect(page).to have_content(@user.name)
    expect(page).to have_css("img[src*='#{@user.photo}']")
    expect(page).to have_content(@user.bio)
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end
  scenario 'can see see all posts link' do
    expect(page).to have_link('See all posts')
  end
  scenario 'can see three posts' do
    expect(page).to have_content('post 4')
    expect(page).to have_content('post 3')
    expect(page).to have_content('post 2')
  end
  scenario 'click See all posts, redirect to users posts index page' do
    click_link('See all posts')
    expect(page).to have_current_path("/users/#{@user.id}/posts")
  end
  scenario 'click one post, redirect to users post page' do
    click_link('post 4')
    @post = @user.posts.find_by(title: 'post 4')
    expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
  end
end
