class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

private

  def update_post_counter
    user.increment!(:posts_count)
  end
end
