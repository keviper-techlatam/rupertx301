Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :users, function: Resolvers::Users.new
  field :notifications, function: Resolvers::Notifications.new
  field :accounts, function: Resolvers::Accounts.new
  field :contracts, function: Resolvers::Contracts.new
  field :risks, function: Resolvers::Risks.new
  
end