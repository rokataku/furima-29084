class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image
      t.string :name
      t.string :description
      t.string :detail
      t.string :shipping
      t.string :price
      t.timestamps
    end
  end
end
