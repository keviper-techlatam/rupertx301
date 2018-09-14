Types::NotificationType = GraphQL::ObjectType.define do
  name "Notification"
  
	# field :_id, !types.ID
	field :notification, !types.String
	# field :user_id, !types.ID
	
end