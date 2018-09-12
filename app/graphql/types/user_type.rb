Types::UserType = GraphQL::ObjectType.define do
  name "User"
  
	field :id, !types.ID
	field :email, !types.String

	field :accounts do
		type types[Types::AccountType]
		resolve -> (obj, args, ctx) {
		  obj.accounts
		}
	end
end