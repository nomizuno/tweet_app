class ChangeDatatypePostUsersIdOfLikes < ActiveRecord::Migration[5.0]
  def change
  	change_column :likes, :post_users_id, :integer
 end
  
end
