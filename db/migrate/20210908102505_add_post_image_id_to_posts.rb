class AddPostImageIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_image_id, :string
  end
end
