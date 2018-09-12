class Resolvers::CreateUser < GraphQL::Function
  argument :email, types.ID
  type Types::UserType

  def call(_obj, args, ctx)
	  User.create(
        email: args[:email],
      )
  end
end