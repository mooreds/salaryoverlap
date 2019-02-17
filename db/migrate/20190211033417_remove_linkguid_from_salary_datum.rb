class RemoveLinkguidFromSalaryDatum < ActiveRecord::Migration[5.2]
  def change
    remove_column :salary_data, :linkguid, :string
  end
end
