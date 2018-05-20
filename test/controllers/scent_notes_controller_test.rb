require 'test_helper'

class ScentNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scent_note = scent_notes(:one)
  end

  test "should get index" do
    get scent_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_scent_note_url
    assert_response :success
  end

  test "should create scent_note" do
    assert_difference('ScentNote.count') do
      post scent_notes_url, params: { scent_note: { note_id: @scent_note.note_id, scent_id: @scent_note.scent_id } }
    end

    assert_redirected_to scent_note_url(ScentNote.last)
  end

  test "should show scent_note" do
    get scent_note_url(@scent_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_scent_note_url(@scent_note)
    assert_response :success
  end

  test "should update scent_note" do
    patch scent_note_url(@scent_note), params: { scent_note: { note_id: @scent_note.note_id, scent_id: @scent_note.scent_id } }
    assert_redirected_to scent_note_url(@scent_note)
  end

  test "should destroy scent_note" do
    assert_difference('ScentNote.count', -1) do
      delete scent_note_url(@scent_note)
    end

    assert_redirected_to scent_notes_url
  end
end
