class AddMaterialAndWishToMatches < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :material, foreign_key: true
    add_reference :matches, :wish, foreign_key: true
  end
end
