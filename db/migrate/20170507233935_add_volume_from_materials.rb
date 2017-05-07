class AddVolumeFromMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :volume, :integer
  end
end
