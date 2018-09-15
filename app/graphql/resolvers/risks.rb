class Resolvers::Risks < GraphQL::Function
    type !types[Types::RiskType]
    argument :per_page, types.Int
    argument :page, types.Int
    argument :riskID, types.ID
    def call(_, args, _)
        if args[:riskID]
            Risk.where(id: args[:riskID])
        else
            if args[:per_page]
                @per_page = args[:per_page]
                if args[:page]
                    @page = (args[:page]-1)*args[:per_page]
                else
                    @page = nil
                end
            else
                @page = nil
                @per_page = nil
            end
            Risk.limit(@per_page).offset(@page).all
        end
    end
end