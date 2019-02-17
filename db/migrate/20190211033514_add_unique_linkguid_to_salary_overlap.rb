class AddUniqueLinkguidToSalaryOverlap < ActiveRecord::Migration[5.2]
  def change
    add_index :salary_overlaps, :linkguid, unique: true
  end
end
