class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :like_id
      t.integer :comment_id
      t.string :post_image
      t.text :post_detail

      t.timestamps
    end
  end
end
