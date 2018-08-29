class AnalyticsController < ApplicationController
	before_action :authenticate_user!
	layout 'user'

  def index


	end
	
	def logs
		@authentication_logs = []
	end

end
