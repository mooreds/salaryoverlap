class CreateAddSalaryData < ActiveRecord::Migration[5.2]
  def change
    create_table :add_salary_data do |t|
      t.string :email
      t.string :linkguid
      t.integer :low
      t.integer :high
      t.boolean :is_employer

      t.timestamps
    end
  end
end
