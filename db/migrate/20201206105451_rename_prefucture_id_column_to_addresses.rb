class RenamePrefuctureIdColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefucture_id, :prefecture_id
  end
end
