require "application_system_test_case"

class SalaryDataTest < ApplicationSystemTestCase
  setup do
    @salary_datum = create :salary_datum
  end

  test "visiting the index" do
    visit salary_data_url
    assert_selector "h1", text: "Salary Data"
  end

  test "creating a Salary datum" do
    visit salary_data_url
    click_on "New Salary Datum"

    fill_in "Email", with: @salary_datum.email
    fill_in "High", with: @salary_datum.high
    find(:label, for: 'salary_datum_is_employer').click
    fill_in "Low", with: @salary_datum.low
    click_on "Create Salary datum"

    assert_text "Salary datum was successfully created"
    click_on "Back"
  end

  test "updating a Salary datum" do
    visit salary_data_url
    click_on "Edit", match: :first

    fill_in "Email", with: @salary_datum.email
    fill_in "High", with: @salary_datum.high
    find(:label, for: 'salary_datum_is_employer').click
    fill_in "Low", with: @salary_datum.low
    click_on "Update Salary datum"

    assert_text "Salary datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Salary datum" do
    visit salary_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salary datum was successfully destroyed"
  end
end
