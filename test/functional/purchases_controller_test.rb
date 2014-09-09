require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post :create, purchase: { address1: @purchase.address1, card_expires_on: @purchase.card_expires_on, card_type: @purchase.card_type, city: @purchase.city, contact_no: @purchase.contact_no, country: @purchase.country, email: @purchase.email, first_name: @purchase.first_name, ip_address: @purchase.ip_address, last_name: @purchase.last_name, product_id: @purchase.product_id, purchased_at: @purchase.purchased_at, state: @purchase.state, total_cost: @purchase.total_cost, zipcode: @purchase.zipcode }
    end

    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should show purchase" do
    get :show, id: @purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase
    assert_response :success
  end

  test "should update purchase" do
    put :update, id: @purchase, purchase: { address1: @purchase.address1, card_expires_on: @purchase.card_expires_on, card_type: @purchase.card_type, city: @purchase.city, contact_no: @purchase.contact_no, country: @purchase.country, email: @purchase.email, first_name: @purchase.first_name, ip_address: @purchase.ip_address, last_name: @purchase.last_name, product_id: @purchase.product_id, purchased_at: @purchase.purchased_at, state: @purchase.state, total_cost: @purchase.total_cost, zipcode: @purchase.zipcode }
    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete :destroy, id: @purchase
    end

    assert_redirected_to purchases_path
  end
end
