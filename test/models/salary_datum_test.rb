require 'test_helper'

class SalaryDatumTest < ActiveSupport::TestCase
  test "default salary datum valid" do
    assert true, build(:salary_datum).valid?
  end
end
