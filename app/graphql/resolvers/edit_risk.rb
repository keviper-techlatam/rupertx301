class Resolvers::EditRisk < GraphQL::Function
  argument :riskID, types.ID
  argument :risk, types.Float
  type Types::RiskType

  def call(_obj, args, ctx)
  	risk = Risk.find_by(id: args[:riskID])
	risk.risk = args[:risk]
	risk.save
	risk
  end
end