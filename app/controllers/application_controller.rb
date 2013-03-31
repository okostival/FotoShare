class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authorize

	def application
		if session[:user_id] == nil
			@user = nil
		else
			@user = User.find(session[:user_id])
		end
	end

	protected
		def authorize
			unless User.find_by_id(session[:user_id])
				redirect_to login_path, notice: "Please log in to access that."
			end
		end
end
