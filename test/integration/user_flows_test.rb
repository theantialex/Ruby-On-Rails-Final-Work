require 'test_helper'

class UsersFlowsTest < ActionDispatch::IntegrationTest

    test 'user creation and main page avalibility' do

        visit 'users/sign_up'
        within('#formContent') do
            fill_in "name_id", with: 'new_user'
            fill_in "email_id", with: 'new_user@mail.ru'
            fill_in "password_id", with: 'new_user'
            fill_in "password_conf_id", with: 'new_user'
            click_button I18n.t('Sign up')
        end

        sleep 4
        assert has_link?("Москва:")
        #assert_current_path "/"

    end

end

