require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'sign up' do
    user = User.new({
    :email => 'hafizbadrie@hotmail.com',
    :name => "hafizblubis",
    :password => "devisetest",
    :password_confirmation => "devisetest"
    })

    assert user.save
  end

  test 'edit user' do
    user = User.first
    new_data = {
    :email => "new@gmail.com",
    :name => "new"
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:email, :name)
    user.update_without_password(new_data)

    assert_equal user.name, 'new'
  end

  test 'user duplicate' do
    user = User.new({
      :email => "hafizbadrie@hotmail.com",
      :name => "hafizblubis",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    user.save

    user = User.new({
      :email => "hafizbadrie@hotmail.com",
      :name => "hafizblubis",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    user.save

    find_res = User.where(email: "hafizbadrie@hotmail.com").count
    assert find_res == 1
   end

  
end
