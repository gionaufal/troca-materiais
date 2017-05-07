class AddVolumeToWishes < ActiveRecord::Migration[5.0]
  def change
    add_column :wishes, :volume, :integer
  end
end
