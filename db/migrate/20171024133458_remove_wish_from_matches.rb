class RemoveWishFromMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :wish, :string
  end
end
