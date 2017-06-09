class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :material
      t.string :wish

      t.timestamps
    end
  end
end
