class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  layout 'user'

  def index
    @data = Stat.all
  end

  def user_growth_json_data
    Stat.fetch_and_update
    render json: [{
      data: Stat.growth_chart_data
    }]
  end

  def logs
    @authentication_logs = []
  end

end
