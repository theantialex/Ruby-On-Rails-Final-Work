class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :members
      t.integer :cost
      t.integer :shipping_cost
      t.text :shipping_options
      t.text :notes

      t.timestamps
    end
  end
end
