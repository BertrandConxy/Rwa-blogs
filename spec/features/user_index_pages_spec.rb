require "rails_helper"

RSpec.feature "Root page", :type => :feature do
  before(:each) do
    @user = User.create(name: 'Bertrand',
                        photo: 'https://randomuser.me/api/portraits/men/87.jpg',
                        bio: 'full stack developer',
                        posts_count: '1',
                        email: 'bertrand@example.com',
                        password: 'password')
    visit users_path
  
  end
  scenario "can see the username" do
    expect(page).to have_content(@user.name)
  end

  scenario "can see the photo" do
    expect(page).to have_css("img[src*='#{@user.photo}']")
  end
  
  scenario "can see the number of posts" do
    expect(page).to have_content("Number of posts: #{@user.posts_count}")
  end

  scenario "click profile, redirect to profile page" do
    login_as(@user)
       click_link('Bertrand')
      expect(page).to have_current_path("/users/#{@user.id}")
  end
end