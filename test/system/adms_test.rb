require "application_system_test_case"

class AdmsTest < ApplicationSystemTestCase
  setup do
    @adm = adms(:one)
  end

  test "visiting the index" do
    visit adms_url
    assert_selector "h1", text: "Adms"
  end

  test "creating a Adm" do
    visit adms_url
    click_on "New Adm"

    fill_in "User", with: @adm.user_id
    click_on "Create Adm"

    assert_text "Adm was successfully created"
    click_on "Back"
  end

  test "updating a Adm" do
    visit adms_url
    click_on "Edit", match: :first

    fill_in "User", with: @adm.user_id
    click_on "Update Adm"

    assert_text "Adm was successfully updated"
    click_on "Back"
  end

  test "destroying a Adm" do
    visit adms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adm was successfully destroyed"
  end
end
