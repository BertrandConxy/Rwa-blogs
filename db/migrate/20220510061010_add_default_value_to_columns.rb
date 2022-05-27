class AddDefaultValueToColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :posts_count, :integer, default: 0
    change_column :posts, :comments_count, :integer, default: 0
    change_column :posts, :likes_count, :integer, default: 0
  end
end
