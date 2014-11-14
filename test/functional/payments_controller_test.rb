require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { billing_zip: @payment.billing_zip, card_number: @payment.card_number, cvv: @payment.cvv, email_address: @payment.email_address, expiration_date: @payment.expiration_date, first_name: @payment.first_name, first_name_on_card: @payment.first_name_on_card, last_name: @payment.last_name, last_name_on_card: @payment.last_name_on_card, organization: @payment.organization, string: @payment.string, subscription_id: @payment.subscription_id }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    put :update, id: @payment, payment: { billing_zip: @payment.billing_zip, card_number: @payment.card_number, cvv: @payment.cvv, email_address: @payment.email_address, expiration_date: @payment.expiration_date, first_name: @payment.first_name, first_name_on_card: @payment.first_name_on_card, last_name: @payment.last_name, last_name_on_card: @payment.last_name_on_card, organization: @payment.organization, string: @payment.string, subscription_id: @payment.subscription_id }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
