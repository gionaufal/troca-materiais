class RemoveMaterialFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :material, :string
  end
end
