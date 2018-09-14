class Notification
  include Mongoid::Document
  include Mongoid::Timestamps
	# field :_id, type: String
	# field :user_id, type: Integer
	field :notification, type: String
	# def user
	#     User.find(self.user_id)
	# end
end