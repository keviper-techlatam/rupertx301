Types::RiskType = GraphQL::ObjectType.define do
  name "Risk"
  
  field :id, !types.ID
  field :risk, !types.Float
  field :account, -> { Types::AccountType }
	
end