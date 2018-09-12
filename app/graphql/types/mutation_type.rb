Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, Types::UserType do
    argument :email, !types.String

    resolve -> (obj, args, ctx) {
      User.create(
        email: args[:email],
      )
    }
  end

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
  	argument :accountId, types.ID
  	type Types::RiskType

    resolve -> (obj, args, ctx) {
	    Risk.create!(
	      account: Account.find_by(id: args[:accountId]),
	      risk: args[:risk]
	    )
    }
  end
end