module Admin
	class ApplicationController < ActionController::Base
	layout "admin"
		
		before_action :admin?
		before_action :authenticate_user!

		private
			def admin?
				if current_user && current_user.admin?
				else
					flash[:error]= "you are not authorized"
					redirect_to root_path
				end
			end
	end
end