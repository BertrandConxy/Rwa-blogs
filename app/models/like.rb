class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: true

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_count)
  end
end
