class RemoveVolumeFromWishes < ActiveRecord::Migration[5.0]
  def change
    remove_column :wishes, :volume, :string
  end
end
