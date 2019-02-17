require 'test_helper'

class SalaryDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salary_datum = create :salary_datum
  end

  test "should get index" do
    assert_raises(ActionController::RoutingError) do
      get salary_data_url
    end
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

  test "should create salary_datum associated with existing overlap" do
    assert_difference('SalaryDatum.count') do
      post salary_data_url, params: { salary_datum: { email: "anotheremail", high: @salary_datum.high+10, is_employer: !@salary_datum.is_employer, low: @salary_datum.low+ 4, salary_overlap_id: @salary_datum.salary_overlap_id } }
    end
    @salary_datum.salary_overlap.reload
    assert @salary_datum.salary_overlap.salary_data.size == 2
    assert_redirected_to salary_datum_url(SalaryDatum.last)
  end

  test "should show salary_datum" do
    get salary_datum_url(@salary_datum)
    assert_response :success
  end

  test "should get edit" do
    assert_raises(NoMethodError) do
      get edit_salary_datum_url(@salary_datum)
    end
  end

  test "should update salary_datum" do
    assert_raises(ActionController::RoutingError) do
      patch salary_datum_url(@salary_datum), params: { salary_datum: { email: @salary_datum.email, high: @salary_datum.high, is_employer: @salary_datum.is_employer, low: @salary_datum.low } }
    end
  end

  test "should destroy salary_datum" do
    assert_raises(ActionController::RoutingError) do
      delete salary_datum_url(@salary_datum)
    end
  end
end
