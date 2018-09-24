class Resolvers::CreateUser < GraphQL::Function
  argument :email, !types.String
  argument :password, !types.String
  type Types::UserType
  def call(_obj, args, ctx)
  	password = args[:password]
  	pepper = nil
  	 encrypted_password = ::BCrypt::Password.create("#{password}#{pepper}", :cost => 10).to_s
	  user = User.create(
        email: args[:email],
        encrypted_password: encrypted_password,
      )
  end
end