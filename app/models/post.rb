class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments, class_name: 'Comment', foreign_key: true
  has_many :likes, class_name: 'Like', foreign_key: true

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_post_counter
    user.increment!(:posts_count)
  end
end
