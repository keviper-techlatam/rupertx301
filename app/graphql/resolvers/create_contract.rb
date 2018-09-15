class Resolvers::CreateContract < GraphQL::Function
  argument :accountId, !types.ID
  argument :status, !types.String
  type Types::ContractType

  def call(_obj, args, ctx)
	Contract.create(
	  account: Account.find_by(id: args[:accountId]),
	  status: args[:status]
	)
  end
end