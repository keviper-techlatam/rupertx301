Types::RiskType = GraphQL::ObjectType.define do
  name "Risk"
  
	field :id, !types.ID
	field :risk, !types.Float
	field :account_risks do
	type types[Types::AccountRisksType]
		resolve -> (obj, args, ctx) {
		  obj.account_risk
		}
	end
	
end