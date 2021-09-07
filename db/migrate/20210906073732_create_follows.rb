class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.string :follow_id
      t.string :follower_id

      t.timestamps
    end
  end
end
