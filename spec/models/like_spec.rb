require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:author) do
    User.new(name: 'Bertrand', id: 1)
  end

  let(:post) do
    Post.new(title: 'the 10 JS best practices', id: 1)
  end
  subject do
    described_class.new(id: 1,
                        author: author,
                        post: post,
                        created_at: Time.now,
                        updated_at: Time.now)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without Author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without Post' do
      subject.post = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end
end
