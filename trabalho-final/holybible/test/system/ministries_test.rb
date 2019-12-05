require "application_system_test_case"

class MinistriesTest < ApplicationSystemTestCase
  setup do
    @ministry = ministries(:one)
  end

  test "visiting the index" do
    visit ministries_url
    assert_selector "h1", text: "Ministries"
  end

  test "creating a Ministry" do
    visit ministries_url
    click_on "New Ministry"

    fill_in "Church", with: @ministry.church_id
    fill_in "Date", with: @ministry.date
    fill_in "Description", with: @ministry.description
    fill_in "Picture", with: @ministry.picture
    fill_in "Text", with: @ministry.text
    fill_in "Title", with: @ministry.title
    fill_in "User", with: @ministry.user_id
    click_on "Create Ministry"

    assert_text "Ministry was successfully created"
    click_on "Back"
  end

  test "updating a Ministry" do
    visit ministries_url
    click_on "Edit", match: :first

    fill_in "Church", with: @ministry.church_id
    fill_in "Date", with: @ministry.date
    fill_in "Description", with: @ministry.description
    fill_in "Picture", with: @ministry.picture
    fill_in "Text", with: @ministry.text
    fill_in "Title", with: @ministry.title
    fill_in "User", with: @ministry.user_id
    click_on "Update Ministry"

    assert_text "Ministry was successfully updated"
    click_on "Back"
  end

  test "destroying a Ministry" do
    visit ministries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ministry was successfully destroyed"
  end
end
