require "application_system_test_case"

class ScentNotesTest < ApplicationSystemTestCase
  setup do
    @scent_note = scent_notes(:one)
  end

  test "visiting the index" do
    visit scent_notes_url
    assert_selector "h1", text: "Scent Notes"
  end

  test "creating a Scent note" do
    visit scent_notes_url
    click_on "New Scent Note"

    fill_in "Note", with: @scent_note.note_id
    fill_in "Scent", with: @scent_note.scent_id
    click_on "Create Scent note"

    assert_text "Scent note was successfully created"
    click_on "Back"
  end

  test "updating a Scent note" do
    visit scent_notes_url
    click_on "Edit", match: :first

    fill_in "Note", with: @scent_note.note_id
    fill_in "Scent", with: @scent_note.scent_id
    click_on "Update Scent note"

    assert_text "Scent note was successfully updated"
    click_on "Back"
  end

  test "destroying a Scent note" do
    visit scent_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scent note was successfully destroyed"
  end
end
