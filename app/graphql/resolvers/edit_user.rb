class Resolvers::EditUser < GraphQL::Function
  argument :userID, types.ID
  argument :email, types.String
  type Types::UserType

  def call(_obj, args, ctx)
  	user = User.find_by(id: args[:userID])
	user.email = args[:email]
	user.save
	user
  end
end