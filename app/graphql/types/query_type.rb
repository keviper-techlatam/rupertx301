Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  field :allUser do
    type types[Types::UserType]
    description "A list of all the User"

    resolve -> (obj, args, ctx) {
      User.all
    }
  end
  field :allNotification do
    type types[Types::NotificationType]
    description "A list of all the Notification"

    resolve -> (obj, args, ctx) {
      Notification.all
    }
  end

  field :user do
    type Types::UserType
    description "Return a User"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { User.find(args[:id]) }
  end
  field :allAccount do
    type types[Types::AccountType]
    description "A list of all the Account"

    resolve -> (obj, args, ctx) {
      Account.all
    }
  end

  field :account do
    type Types::AccountType
    description "Return a Account"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Account.find(args[:id]) }
  end

  field :allContract do
    type types[Types::ContractType]
    description "A list of all the Contract"

    resolve -> (obj, args, ctx) {
      Contract.all
    }
  end
  field :risk do
    type Types::RiskType
    description "Return a Risk"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Risk.find(args[:id]) }
  end

  field :allRisk do
    type types[Types::RiskType]
    description "A list of all the Risk"

    resolve -> (obj, args, ctx) {
      Risk.all
    }
  end

  field :contract do
    type Types::ContractType
    description "Return a Contract"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Contract.find(args[:id]) }
  end
end