require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = create(:user)
    @post = create(:post, author: @user)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@post).to be_valid
    end
    it 'is not valid without a title' do
      @post.title = nil
      expect(@post).to_not be_valid
    end
    it 'is not valid with title length greater than 250' do
      expect(@post.title.length).to be_between(1, 250)
    end

    it 'is not valid without valid comments_count and likes_count attribute' do
      @post.comments_count = 'one'
      @post.likes_count = 'one'
      expect(@post).to_not be_valid
    end

    it 'is not valid without valid comments_count and likes_count integer attribute' do
      expect(@post.comments_count).to be >= 0
      expect(@post.likes_count).to be >= 0
    end
  end

  describe 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'methods' do
    it 'most recent comments must be five' do
      6.times do
        @post.comments.create(text: 'So inspiring!!', author: @user)
      end
      @recent_comments = @post.most_recent_comments
      expect(@recent_comments.size).to eq(5)
    end

    it 'increments the number of posts on author' do
      @user.posts.create(title: 'Inspire', text: 'So inspiring!!', author: @user)
      expect(@user.posts_count).to be > 0
    end
  end
end
