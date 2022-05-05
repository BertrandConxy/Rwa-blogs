class RemoveLikeIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_index :likes, column: :like_id, unique: true
    remove_column :likes, :like_id, :bigint, null: false
  end
end
