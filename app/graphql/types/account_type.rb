Types::AccountType = GraphQL::ObjectType.define do
  name "Account"
  
  field :id, !types.ID
  field :balance, !types.Float
  field :user, -> { Types::UserType }
  field :contract, -> { Types::ContractType }
	field :account_risks do
	type types[Types::AccountRisksType]
		resolve -> (obj, args, ctx) {
		  obj.account_risk
		}
	end
	
end