require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get dit" do
    get public_customers_dit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_customers_unsubscribe_url
    assert_response :success
  end
end
