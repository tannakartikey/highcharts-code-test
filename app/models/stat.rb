class Stat < ApplicationRecord
  belongs_to :app

  scope :last_thirty_days, -> { where("period_starting > ?", 30.days.ago) }

  def self.fetch_and_update
    fetch and update
  end

  def self.fetch interval="month"
    auth = {
      username: ENV['QRYPTO_USERNAME'],
      password: ENV['QRYPTO_PASSWORD'],
    }

    base_uri = "https://srv.qryp.to/api/logsummary/825db136-ce87-444c-8b7c-89f6b49a00eb/#{interval}"

    @stats ||= HTTParty.get( base_uri, basic_auth: auth)
  end

  def self.update
    @stats.map do |stat|
      record = Stat.find_or_initialize_by(
        client_id: stat['client_id'],
      )
      record.save!
    end
  end

  def self.growth_chart_data
    last_thirty_days.collect do |e|
      [
        e['period_starting'].utc.to_datetime.strftime("%Q").to_i,
        e['distinct_identities']
      ]
    end
  end
end
