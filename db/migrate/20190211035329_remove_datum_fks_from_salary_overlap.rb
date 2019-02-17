class RemoveDatumFksFromSalaryOverlap < ActiveRecord::Migration[5.2]
  def change
    remove_reference(:salary_overlaps, :employer_salary_datum)
    remove_reference(:salary_overlaps, :employee_salary_datum)
  end
end
