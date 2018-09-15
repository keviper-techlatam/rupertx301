Types::NotificationType = GraphQL::ObjectType.define do
  name "Notification"
  
	# field :_id, !types.ID
	field :notification, !types.String
	field :user_id, !types.Int
	field :user do
		type types[Types::UserType]
		resolve -> (obj, args, ctx) {
		  obj.user
		}
	end
end