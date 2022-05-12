require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) do
    User.create(name: 'Bertrand', id: 1)
  end
  subject do
    described_class.create(title: 'the 10 JS best practices',
                           text: 'The following are the ten JavaScript best programming practices every should know.',
                           comments_count: 1,
                           likes_count: 2,
                           author: author,
                           id: 1,
                           created_at: Time.now,
                           updated_at: Time.now)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with title length greater than 250' do
      expect(subject.title.length).to be_between(1, 250)
    end

    it 'is not valid without valid comments_count and likes_count attribute' do
      subject.comments_count = 'one'
      subject.likes_count = 'one'
      expect(subject).to_not be_valid
    end

    it 'is not valid without valid comments_count and likes_count integer attribute' do
      expect(subject.comments_count).to be >= 0
      expect(subject.likes_count).to be >= 0
    end
  end

  describe 'Associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'methods' do
    it 'most recent comments must be five' do
      6.times do
        subject.comments.create(text: 'So inspiring!!', author: author)
      end
      @recent_comments = subject.most_recent_comments
      expect(@recent_comments.size).to eq(5)
    end

    it 'increments the number of posts on author' do
      author.posts.create(title: 'Inspire', text: 'So inspiring!!', author: author)
      expect(author.posts_count).to eq(2)
    end
  end
end
