class AddPostUsersIdToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :post_users_id, :string
  end
end
