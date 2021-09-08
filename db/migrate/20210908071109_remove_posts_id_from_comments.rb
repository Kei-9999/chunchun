class RemovePostsIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :posts_id, :integer
  end
end
