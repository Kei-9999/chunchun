class CreateKawaiis < ActiveRecord::Migration[5.2]
  def change
    create_table :kawaiis do |t|

      t.timestamps
    end
  end
end
