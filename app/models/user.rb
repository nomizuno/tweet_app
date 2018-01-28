class User < ActiveRecord::Base
	validates :email, {presence: true, uniqueness: true}
	validates :name, {presence: true,  uniqueness: true}
	validates :password, {presence: true}

	def posts
		return Post.where(user_id: self.id)
	end

end
