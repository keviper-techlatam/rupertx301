class Resolvers::Contracts < GraphQL::Function
    type !types[Types::ContractType]
    argument :per_page, types.Int
    argument :page, types.Int
    argument :contractID, types.ID
    def call(_, args, _)
        if args[:contractID]
            Contract.where(id: args[:contractID])
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
            Contract.limit(@per_page).offset(@page).all
        end
    end
end