class AddUserToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user, :string
  end
end
