require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.create(id: 1,
                           name: 'Bertrand',
                           photo: 'https://randomuser.me/api/portraits/men/20.jpg',
                           bio: 'Full-stack software developer',
                           posts_count: 3,
                           created_at: Time.now,
                           updated_at: Time.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without valid posts_count attribute' do
    subject.posts_count = 'one'
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
  describe 'methods' do
    it 'most recent posts must be three' do
      4.times do
        subject.posts.create(title: '10 JS best practices', text: 'we are going to see them', author: subject)
      end
      @recent_posts = subject.recent_posts
      expect(@recent_posts.size).to eq(3)
    end

    it 'first of most recent posts must be the last posts created' do
      4.times do
        subject.posts.create(title: '10 JS best practices', text: 'we are going to see them', author: subject)
      end
      first_most_recent_post = subject.recent_posts.first
      expect(first_most_recent_post.title).to eq('10 JS best practices')
    end
  end
end
