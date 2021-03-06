class Resolvers::Accounts < GraphQL::Function
    type !types[Types::AccountType]
    argument :per_page, types.Int
    argument :page, types.Int
    argument :accountID, types.ID
    def call(_, args, _)
        if args[:accountID]
            Account.where(id: args[:accountID])
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
            Account.limit(@per_page).offset(@page).all
        end
    end
end