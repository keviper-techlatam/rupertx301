Rails.application.routes.draw do
  use_doorkeeper do
	 skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  post "/graphql-api", to: "graphqlapi#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#graphql'
end
