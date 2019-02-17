class CreateSalaryOverlaps < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_overlaps do |t|
      t.string :linkguid, null: false

      t.timestamps
    end
  end
end
