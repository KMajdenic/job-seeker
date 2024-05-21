require "application_system_test_case"

class ClassfieldsTest < ApplicationSystemTestCase
  setup do
    @classfield = classfields(:one)
  end

  test "visiting the index" do
    visit classfields_url
    assert_selector "h1", text: "Classfields"
  end

  test "should create classfield" do
    visit classfields_url
    click_on "New classfield"

    click_on "Create Classfield"

    assert_text "Classfield was successfully created"
    click_on "Back"
  end

  test "should update Classfield" do
    visit classfield_url(@classfield)
    click_on "Edit this classfield", match: :first

    click_on "Update Classfield"

    assert_text "Classfield was successfully updated"
    click_on "Back"
  end

  test "should destroy Classfield" do
    visit classfield_url(@classfield)
    click_on "Destroy this classfield", match: :first

    assert_text "Classfield was successfully destroyed"
  end
end
