class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :product
      t.string :volume
      t.string :wish

      t.timestamps
    end
  end
end
