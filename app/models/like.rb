class Like < ActiveRecord::Base
	validates :user_id, {presence: true}
	validates :post_id, {presence: true}
end
