class Resolvers::CreateAccount < GraphQL::Function
  argument :userID, !types.ID
  argument :balance, !types.Float
  type Types::AccountType

  def call(_obj, args, ctx)
	Account.create(
	  user: User.find_by(id: args[:userID]),
	  balance: args[:balance]
	)
  end
end