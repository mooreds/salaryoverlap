require "application_system_test_case"

class SalaryDataTest < ApplicationSystemTestCase
  setup do
    @salary_datum = create :salary_datum
  end

  test "creating a Salary datum" do
    visit salary_data_url
    click_on "New Salary Datum"

    fill_in "Email", with: @salary_datum.email
    fill_in "High", with: @salary_datum.high
    find(:label, for: 'salary_datum_is_employer').click
    fill_in "Low", with: @salary_datum.low
    click_on "Create Salary datum"

    assert_text "Link to share: "
  end
end
