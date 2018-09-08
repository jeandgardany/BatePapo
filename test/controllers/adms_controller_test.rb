require 'test_helper'

class AdmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adm = adms(:one)
  end

  test "should get index" do
    get adms_url
    assert_response :success
  end

  test "should get new" do
    get new_adm_url
    assert_response :success
  end

  test "should create adm" do
    assert_difference('Adm.count') do
      post adms_url, params: { adm: { user_id: @adm.user_id } }
    end

    assert_redirected_to adm_url(Adm.last)
  end

  test "should show adm" do
    get adm_url(@adm)
    assert_response :success
  end

  test "should get edit" do
    get edit_adm_url(@adm)
    assert_response :success
  end

  test "should update adm" do
    patch adm_url(@adm), params: { adm: { user_id: @adm.user_id } }
    assert_redirected_to adm_url(@adm)
  end

  test "should destroy adm" do
    assert_difference('Adm.count', -1) do
      delete adm_url(@adm)
    end

    assert_redirected_to adms_url
  end
end
