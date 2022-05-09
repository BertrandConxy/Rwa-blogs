class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', counter_cache: true
  has_many :comments
  has_many :likes

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:posts_count)
  end
end
