Types::AccountType = GraphQL::ObjectType.define do
  name "Account"
  
  field :id, !types.ID
  field :balance, !types.Float
  field :user, -> { Types::UserType }
  field :contract, -> { Types::ContractType }
	field :risks do
		type types[Types::RiskType]
		resolve -> (obj, args, ctx) {
		  obj.risk
		}
	end
	
end