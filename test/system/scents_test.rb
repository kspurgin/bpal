require "application_system_test_case"

class ScentsTest < ApplicationSystemTestCase
  setup do
    @scent = scents(:one)
  end

  test "visiting the index" do
    visit scents_url
    assert_selector "h1", text: "Scents"
  end

  test "creating a Scent" do
    visit scents_url
    click_on "New Scent"

    fill_in "Brand", with: @scent.brand_id
    fill_in "Description", with: @scent.description
    fill_in "Name", with: @scent.name
    click_on "Create Scent"

    assert_text "Scent was successfully created"
    click_on "Back"
  end

  test "updating a Scent" do
    visit scents_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @scent.brand_id
    fill_in "Description", with: @scent.description
    fill_in "Name", with: @scent.name
    click_on "Update Scent"

    assert_text "Scent was successfully updated"
    click_on "Back"
  end

  test "destroying a Scent" do
    visit scents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scent was successfully destroyed"
  end
end
