Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new
  field :createAccount, function: Resolvers::CreateAccount.new
  field :createContract, function: Resolvers::CreateContract.new
  field :createRisk, function: Resolvers::CreateRisk.new
  field :createNotification, function: Resolvers::CreateNotification.new
  field :createAccountRisk, function: Resolvers::CreateAccountRisk.new

end