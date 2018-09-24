class User < ApplicationRecord

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable
	has_many :accounts 
	# def notification
	# 	Notification.where(user_id: self.id).order_by({created_at: -1}).one
	# end

	# def notification=(notification)
	# 	Notification.create!(user_id: self.id, notification: notification)
	# end

	def notifications
		Notification.where(user_id: self.id).order_by({created_at: -1})
	end

	class << self
	   def authenticate(email, password)
	     user = User.find_for_authentication(email: email)
	     user.try(:valid_password?, password) ? user : nil
	   end
	end
end
