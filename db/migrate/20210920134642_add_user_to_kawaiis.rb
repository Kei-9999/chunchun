class AddUserToKawaiis < ActiveRecord::Migration[5.2]
  def change
    add_column :kawaiis, :user_id, :integer
    add_column :kawaiis, :post_id, :integer
  end
end
