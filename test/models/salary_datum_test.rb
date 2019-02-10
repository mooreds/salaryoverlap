require 'test_helper'

class SalaryDatumTest < ActiveSupport::TestCase
  test "default salary datum valid" do
    assert true, build(:salary_datum).valid?
  end
  test "salary datum invalid with high lower than low" do
    assert true, build(:salary_datum, high: 1, low: 2).invalid?
  end
  test "salary datum invalid with nil email" do
    assert true, build(:salary_datum, email: nil).invalid?
  end
  test "salary datum invalid with nil linkguid" do
    assert true, build(:salary_datum, linkguid: nil).invalid?
  end
  test "salary datum invalid with nil linkguid" do
    assert true, build(:salary_datum, linkguid: nil).invalid?
  end
end
