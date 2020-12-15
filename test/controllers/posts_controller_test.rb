require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    test 'authenticated users can get main page' do
        sign_in users(:two)
        get root_url
        assert_response :success
    end

    test 'authenticated users can create posts' do
        sign_in users(:two)
        get '/posts/new'
        assert_response :success
    end

    test 'unauthenticated users cant get main page' do
        get root_url
        assert_response :redirect
    end

    test 'unauthenticated users cant create posts' do
        get '/posts/new'
        assert_response :redirect
    end

end
