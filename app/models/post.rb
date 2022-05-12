class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :comments
  has_many :likes

  validates_associated :comments, :likes
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:posts_count)
  end
end
