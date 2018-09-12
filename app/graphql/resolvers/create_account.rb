class Resolvers::CreateAccount < GraphQL::Function
  argument :userID, types.ID

  type Types::AccountType

  def call(_obj, args, ctx)
    Account.create!(
      user: User.find_by(id: args[:userID]),
      balance: args[:balance]
    )
  end
end