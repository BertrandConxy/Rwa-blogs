require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Bertrand",
                        photo: "https://randomuser.me/api/portraits/men/20.jpg",
                        bio: "Full-stack software developer",
                        posts_count: 0,
                        created_at: Time.now,
                        updated_at: Time.now)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without valid posts_count attribute" do
    subject.posts_count = 'one'
    expect(subject).to_not be_valid
  end

describe "Associations" do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }
end
end
