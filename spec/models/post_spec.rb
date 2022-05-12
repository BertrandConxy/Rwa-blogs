require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:author) {
    User.new(:name => "Bertrand")
  }
  subject {
    described_class.new(title: "the 10 JS best practices",
                        text: "The following are the ten JavaScript best programming practices every devloper should know.",
                        comments_count: 1,
                        likes_count: 2,
                        author: author,
                        id: 1,
                        created_at: Time.now,
                        updated_at: Time.now)

  }

  describe "validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it "is not valid with title length greater than 250" do
      expect(subject.title.length).to be_between(1,250)
    end

    it "is not valid without valid comments_count and likes_count attribute" do
      subject.comments_count = 'one'
      subject.likes_count = 'one'
      expect(subject).to_not be_valid
    end

    it "is not valid without valid comments_count and likes_count integer attribute" do
      expect(subject.comments_count).to be >= 0
      expect(subject.likes_count).to be >= 0
    end 
  end

  describe "Associations" do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
