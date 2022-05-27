class RenameCounterColumnsForTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comments_counter, :comments_count
    rename_column :posts, :likes_counter, :likes_count
  end
end
