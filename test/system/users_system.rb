require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

  test "registration and create post avalibility test" do
    visit new_user_registration_path
    
    fill_in "name_id", with: "test"
    fill_in "email_id", with: 'test_user@yandex.ru'
    fill_in "password_id", with: 'test_user'
    fill_in "password_conf_id", with: 'test_user'
    click_button I18n.t('Sign up')
    assert_current_path root_path

    visit new_post_path
    assert_current_path new_post_path

  end
    
end