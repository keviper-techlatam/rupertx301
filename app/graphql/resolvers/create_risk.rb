class Resolvers::CreateRisk < GraphQL::Function
  argument :risk, !types.Float
  type Types::RiskType

  def call(_obj, args, ctx)
	Risk.create(
	  risk: args[:risk]
	)
  end
end