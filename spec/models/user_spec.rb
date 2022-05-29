require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without valid posts_count attribute' do
    @user.posts_count = 'one'
    expect(@user).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  describe 'methods' do
    it 'most recent posts must be three' do
      4.times do
        @user.posts.create(title: '10 JS best practices', text: 'we are going to see them', author: @user)
      end
      @recent_posts = @user.recent_posts
      expect(@recent_posts.size).to eq(3)
    end

    it 'first of most recent posts must be the last posts created' do
      4.times do
        @user.posts.create(title: '10 JS best practices', text: 'we are going to see them', author: @user)
      end
      first_most_recent_post = @user.recent_posts.first
      expect(first_most_recent_post.title).to eq('10 JS best practices')
    end
  end
end
