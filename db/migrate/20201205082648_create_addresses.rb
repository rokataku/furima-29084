class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,   default: "", null: false
      t.integer :prefucture_id,              null: false
      t.string  :city,          default: "", null: false
      t.string  :house_number,  default: "", null: false
      t.string  :building_name, default: ""
      t.string  :phonenumber,   default: "", null: false
      t.integer :item_id,                    null: false, foreign_key: true
      t.timestamps
    end
  end
end
