Types::AccountRisksType = GraphQL::ObjectType.define do
  name "AccountRisk"
  
  field :id, !types.ID
  field :risk, -> { Types::RiskType }
  field :account, -> { Types::AccountType }
	
end