class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id', counter_cache: true
  has_many :comments, class_name: 'Comment', foreign_key: true
  has_many :likes, class_name: 'Like', foreign_key: true
end
