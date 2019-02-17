class AddForeignKeysToSalaryOverlap < ActiveRecord::Migration[5.2]
  def change
    add_reference(:salary_overlaps, :employer_salary_datum, foreign_key: {to_table: :salary_data})
    add_reference(:salary_overlaps, :employee_salary_datum, foreign_key: {to_table: :salary_data})
  end
end
