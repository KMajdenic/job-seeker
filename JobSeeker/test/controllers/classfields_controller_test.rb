require "test_helper"

class ClassfieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classfield = classfields(:one)
  end

  test "should get index" do
    get classfields_url
    assert_response :success
  end

  test "should get new" do
    get new_classfield_url
    assert_response :success
  end

  test "should create classfield" do
    assert_difference("Classfield.count") do
      post classfields_url, params: { classfield: {  } }
    end

    assert_redirected_to classfield_url(Classfield.last)
  end

  test "should show classfield" do
    get classfield_url(@classfield)
    assert_response :success
  end

  test "should get edit" do
    get edit_classfield_url(@classfield)
    assert_response :success
  end

  test "should update classfield" do
    patch classfield_url(@classfield), params: { classfield: {  } }
    assert_redirected_to classfield_url(@classfield)
  end

  test "should destroy classfield" do
    assert_difference("Classfield.count", -1) do
      delete classfield_url(@classfield)
    end

    assert_redirected_to classfields_url
  end
end
