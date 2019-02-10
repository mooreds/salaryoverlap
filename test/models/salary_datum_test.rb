# == Schema Information
#
# Table name: salary_data
#
#  id          :bigint(8)        not null, primary key
#  email       :string
#  linkguid    :string
#  low         :integer
#  high        :integer
#  is_employer :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SalaryDatumTest < ActiveSupport::TestCase
  test "default datum valid" do
    assert true, build(:salary_datum).valid?
  end
  test "invalid with high lower than low" do
    assert false, build(:salary_datum, high: 1, low: 2).valid?
  end
  test "invalid with nil email" do
    assert false, build(:salary_datum, email: nil).valid?
  end
  test "invalid with nil linkguid" do
    assert false, build(:salary_datum, linkguid: nil).valid?
  end
  test "is_employer values" do
    assert false, build(:salary_datum, is_employer: nil).valid?
    assert false, build(:salary_datum, is_employer: 'abc').valid?
    assert true, build(:salary_datum, is_employer: true).valid?
    assert true, build(:salary_datum, is_employer: false).valid?
  end
end
