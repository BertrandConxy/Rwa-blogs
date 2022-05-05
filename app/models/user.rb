class User < ApplicationRecord
    has_many :comments, class_name: "Comment", foreign_key: true
    has_many :posts, class_name: "Post", foreign_key: true
    has_many :likes, class_name: "Like", foreign_key: true
end
