class CreateSalaryData < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_data do |t|
      t.string :email, null: false
      t.string :linkguid, null: false
      t.integer :low, null: false
      t.integer :high, null: false
      t.boolean :is_employer, null: false

      t.timestamps
    end
  end
end
