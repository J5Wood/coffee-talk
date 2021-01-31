class CreateCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :coffees do |t|
      t.string :name
      t.integer :roast
      t.string :origin
      t.string :notes
      t.integer :stars
      t.integer :brand_id

      t.timestamps
    end
  end
end
