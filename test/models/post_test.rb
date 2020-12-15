require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "new post" do
    post = Post.new({
      :title => "Test",
      :artist => "Test",
      :album => "Test",
      :members => "Test",
      :cost => '1000',
      :shipping_cost => '1000',
      :shipping_options => "Test",
      :notes => "Test",
      :user => "Test@mail.ru"
    })
        
    assert post.save
  end

  test "edit post" do
    post = Post.first
    new_data = {
      :title => "New",
      :artist => "New",
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:title, :artist)
    post.update(new_data)

    assert_equal post.title, 'New'
    assert_equal post.artist, 'New'
  end

end
