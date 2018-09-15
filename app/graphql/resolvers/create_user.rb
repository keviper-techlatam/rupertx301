class Resolvers::CreateUser < GraphQL::Function
  argument :email, types.String
  type Types::UserType

  def call(_obj, args, ctx)
	  User.create(
        email: args[:email],
      )
  end
end