class AddUniqueIndexToLinkguid < ActiveRecord::Migration[5.2]
  def change
    add_index :salary_data, :linkguid, unique: true
  end
end
