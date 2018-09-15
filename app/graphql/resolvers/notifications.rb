class Resolvers::Notifications < GraphQL::Function
    type !types[Types::NotificationType]
    argument :per_page, types.Int
    argument :page, types.Int
    argument :notificationID, types.ID
    def call(_, args, _)
        if args[:notificationID]
            Notification.where(_id: args[:notificationID])
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
            Notification.limit(@per_page).offset(@page).all
        end
    end
end