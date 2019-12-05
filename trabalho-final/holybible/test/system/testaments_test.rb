require "application_system_test_case"

class TestamentsTest < ApplicationSystemTestCase
  setup do
    @testament = testaments(:one)
  end

  test "visiting the index" do
    visit testaments_url
    assert_selector "h1", text: "Testaments"
  end

  test "creating a Testament" do
    visit testaments_url
    click_on "New Testament"

    fill_in "Name", with: @testament.name
    click_on "Create Testament"

    assert_text "Testament was successfully created"
    click_on "Back"
  end

  test "updating a Testament" do
    visit testaments_url
    click_on "Edit", match: :first

    fill_in "Name", with: @testament.name
    click_on "Update Testament"

    assert_text "Testament was successfully updated"
    click_on "Back"
  end

  test "destroying a Testament" do
    visit testaments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Testament was successfully destroyed"
  end
end
