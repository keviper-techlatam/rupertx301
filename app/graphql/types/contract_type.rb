Types::ContractType = GraphQL::ObjectType.define do
  name "Contract"
  
  field :id, !types.ID
  field :status, !types.String
  field :account, -> { Types::AccountType }
end