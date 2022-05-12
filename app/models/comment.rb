class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  validates :text, presence: true, length: { maximum: 400 }

  def update_comment_counter
    post.increment!(:comments_count)
  end
end
