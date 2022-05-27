class RenamePostsCounterForUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :posts_counter, :posts_count
  end
end
