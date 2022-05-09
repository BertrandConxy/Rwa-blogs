class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', counter_cache: true

  def update_comment_counter
    post.increment!(:comments_count)
  end
end
