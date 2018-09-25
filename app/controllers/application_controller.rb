class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception
	def graphql
	 redirect_to "/graphiql"
	end
end

