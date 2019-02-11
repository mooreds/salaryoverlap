require 'test_helper'

class SalaryDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_datum = create :salary_datum
  end

  test "should get index" do
    get salary_data_url
    assert_response :success
  end

  test "should get new" do
    get new_salary_datum_url
    assert_response :success
  end

  test "should create salary_datum" do
    assert_difference('SalaryDatum.count') do
      post salary_data_url, params: { salary_datum: { email: @salary_datum.email, high: @salary_datum.high, is_employer: @salary_datum.is_employer, low: @salary_datum.low } }
    end

    assert_redirected_to salary_datum_url(SalaryDatum.last)
  end

  test "should show salary_datum" do
    get salary_datum_url(@salary_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_salary_datum_url(@salary_datum)
    assert_response :success
  end

  test "should update salary_datum" do
    patch salary_datum_url(@salary_datum), params: { salary_datum: { email: @salary_datum.email, high: @salary_datum.high, is_employer: @salary_datum.is_employer, low: @salary_datum.low } }
    assert_redirected_to salary_datum_url(@salary_datum)
  end

  test "should destroy salary_datum" do
    assert_difference('SalaryDatum.count', -1) do
      delete salary_datum_url(@salary_datum)
    end

    assert_redirected_to salary_data_url
  end
end
