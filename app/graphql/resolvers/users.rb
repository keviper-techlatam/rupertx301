class Resolvers::Users < GraphQL::Function
    type !types[Types::UserType]
    argument :per_page, types.Int
    argument :page, types.Int
    argument :userID, types.ID
    def call(_, args, _)
        if args[:userID]
            User.where(id: args[:userID])
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
            User.limit(@per_page).offset(@page).all
        end
    end
end