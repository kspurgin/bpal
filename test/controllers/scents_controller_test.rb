require 'test_helper'

class ScentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scent = scents(:one)
  end

  test "should get index" do
    get scents_url
    assert_response :success
  end

  test "should get new" do
    get new_scent_url
    assert_response :success
  end

  test "should create scent" do
    assert_difference('Scent.count') do
      post scents_url, params: { scent: { brand_id: @scent.brand_id, description: @scent.description, name: @scent.name } }
    end

    assert_redirected_to scent_url(Scent.last)
  end

  test "should show scent" do
    get scent_url(@scent)
    assert_response :success
  end

  test "should get edit" do
    get edit_scent_url(@scent)
    assert_response :success
  end

  test "should update scent" do
    patch scent_url(@scent), params: { scent: { brand_id: @scent.brand_id, description: @scent.description, name: @scent.name } }
    assert_redirected_to scent_url(@scent)
  end

  test "should destroy scent" do
    assert_difference('Scent.count', -1) do
      delete scent_url(@scent)
    end

    assert_redirected_to scents_url
  end
end
