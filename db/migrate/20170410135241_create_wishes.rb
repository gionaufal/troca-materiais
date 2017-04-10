class CreateWishes < ActiveRecord::Migration[5.0]
  def change
    create_table :wishes do |t|
      t.string :product
      t.float :volume
      t.string :wish

      t.timestamps
    end
  end
end
