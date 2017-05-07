class RemoveVolumeFromMaterials < ActiveRecord::Migration[5.0]
  def change
    remove_column :materials, :volume, :string
  end
end
