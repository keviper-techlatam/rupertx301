class User < ApplicationRecord
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
end
