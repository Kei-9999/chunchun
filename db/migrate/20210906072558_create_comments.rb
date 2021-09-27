class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      # t.integer :user_id
      # t.integer :posts_id
      # t.text :comment
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.timestamps
    end
  end
end
