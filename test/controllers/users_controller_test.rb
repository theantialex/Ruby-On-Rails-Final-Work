require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "sign in" do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url

    follow_redirect!
    assert_response :success
  end

  test 'sign up' do
    get '/users/sign_up'
    assert_response :success
  end

  test 'edit' do
    sign_in users(:one)
    get '/users/edit'
    assert_response :success
  end

end
