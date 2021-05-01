require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get contacts_name:string_url
    assert_response :success
  end

  test "should get email:string" do
    get contacts_email:string_url
    assert_response :success
  end

  test "should get content:text" do
    get contacts_content:text_url
    assert_response :success
  end

end
