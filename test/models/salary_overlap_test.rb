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

require 'test_helper'

class SalaryOverlapTest < ActiveSupport::TestCase
  test "linkguid set on save" do
    so = build(:salary_overlap, linkguid: nil)
    assert so.valid?
    assert so.linkguid.nil?
    so.save
    assert !so.linkguid.nil?
  end
end
