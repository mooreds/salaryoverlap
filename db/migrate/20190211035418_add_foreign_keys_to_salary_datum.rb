class AddForeignKeysToSalaryDatum < ActiveRecord::Migration[5.2]
  def change
    add_reference(:salary_data, :salary_overlap)
  end
end
