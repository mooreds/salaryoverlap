# == Schema Information
#
# Table name: salary_overlaps
#
#  id                       :bigint(8)        not null, primary key
#  linkguid                 :string           not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  employee_salary_datum_id :bigint(8)
#  employer_salary_datum_id :bigint(8)
#
# Indexes
#
#  index_salary_overlaps_on_employee_salary_datum_id  (employee_salary_datum_id)
#  index_salary_overlaps_on_employer_salary_datum_id  (employer_salary_datum_id)
#  index_salary_overlaps_on_linkguid                  (linkguid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (employee_salary_datum_id => salary_data.id)
#  fk_rails_...  (employer_salary_datum_id => salary_data.id)
#

class SalaryOverlap < ApplicationRecord
  before_save :set_linkguid

  private
  def set_linkguid
    self.linkguid = SecureRandom.uuid
  end
end
