Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :editUser, function: Resolvers::EditUser.new
  field :createUser, function: Resolvers::CreateUser.new
  field :createAccount, function: Resolvers::CreateAccount.new
  field :createContract, function: Resolvers::CreateContract.new
  field :editRisk, function: Resolvers::EditRisk.new
  field :createRisk, function: Resolvers::CreateRisk.new
  field :createNotification, function: Resolvers::CreateNotification.new
  field :createAccountRisk, function: Resolvers::CreateAccountRisk.new
end