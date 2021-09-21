class AddKawaiiIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :kawaii_id, :integer
  end
end
