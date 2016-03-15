class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image
      t.decimal :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end
