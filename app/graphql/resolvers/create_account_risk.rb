class Resolvers::CreateAccountRisk < GraphQL::Function
    argument :riskId, !types.ID
    argument :accountId, !types.ID

  type Types::AccountRisksType
  def call(_obj, args, ctx)
	AccountRisk.create(
    	account: Account.find_by(id: args[:accountId]),
      	risk: Risk.find_by(id: args[:riskId]),
    )
  end
end