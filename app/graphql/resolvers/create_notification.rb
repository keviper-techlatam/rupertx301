class Resolvers::CreateNotification < GraphQL::Function
  argument :notification, !types.String
  argument :user_id, !types.Int
  type Types::NotificationType

  def call(_obj, args, ctx)
	Notification.create(
	  user_id: args[:user_id],
	  notification: args[:notification]
	)
  end
end