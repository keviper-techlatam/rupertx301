Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new

  field :createAccount, Types::AccountType do
    argument :balance, !types.Float
  	argument :userID, types.ID
  	type Types::AccountType

    resolve -> (obj, args, ctx) {
	    Account.create!(
	      user: User.find_by(id: args[:userID]),
	      balance: args[:balance]
	    )
    }
  end

  field :createContract, Types::ContractType do
    argument :status, !types.String
  	argument :accountId, types.ID
  	type Types::ContractType

    resolve -> (obj, args, ctx) {
	    Contract.create!(
	      account: Account.find_by(id: args[:accountId]),
	      status: args[:status]
	    )
    }
  end

  field :createRisk, Types::RiskType do
    argument :risk, !types.Float
  	type Types::RiskType

    resolve -> (obj, args, ctx) {
	    Risk.create!(
	      risk: args[:risk]
	    )
    }
  end
  field :createAccountRisk, Types::RiskType do
  	argument :riskId, types.ID
  	argument :accountId, types.ID
  	type Types::AccountRisksType

    resolve -> (obj, args, ctx) {
	    AccountRisk.create!(
	      account: Account.find_by(id: args[:accountId]),
	      risk: Risk.find_by(id: args[:riskId]),
	    )
    }
  end
end