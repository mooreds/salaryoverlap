# == Schema Information
#
# Table name: salary_data
#
#  id                :bigint(8)        not null, primary key
#  email             :string           not null
#  high              :integer          not null
#  is_employer       :boolean          not null
#  low               :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  salary_overlap_id :bigint(8)
#
# Indexes
#
#  index_salary_data_on_salary_overlap_id  (salary_overlap_id)
#

require 'test_helper'

class SalaryDatumTest < ActiveSupport::TestCase
  test "default datum valid" do
    assert build(:salary_datum).valid?
  end
  test "invalid with high lower than low" do
    assert !build(:salary_datum, high: 1, low: 2).valid?
  end
  test "invalid with nil email" do
    assert !build(:salary_datum, email: nil).valid?
  end
  test "is_employer values" do
    assert !build(:salary_datum, is_employer: nil).valid?
    assert build(:salary_datum, is_employer: 'abc').valid?
    assert build(:salary_datum, is_employer: true).valid?
    assert build(:salary_datum, is_employer: false).valid?
  end
  test "salary overlap object set on save" do
    sd = build(:salary_datum)
    assert sd.valid?
    assert !sd.salary_overlap.nil?
  end
  test "salary overlap object on save has expected value for first value" do
    sd = create(:salary_datum, is_employer: true)
    assert sd.salary_overlap.salary_data.first.id == sd.id
    assert sd.salary_overlap.salary_data.second.nil?
  end
end
