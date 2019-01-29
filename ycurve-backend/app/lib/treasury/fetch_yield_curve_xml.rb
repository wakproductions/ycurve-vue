require 'net/http'

module Treasury
  class FetchYieldCurveXML
    include Verbalize::Action

    input :month, :year

    def call
      Net::HTTP.get(api_uri) { |http| http.read }
    end

    private

    def api_uri
      @api_url ||= URI.parse(
        "http://data.treasury.gov/feed.svc/DailyTreasuryYieldCurveRateData?$filter=month(NEW_DATE)%20eq%20#{month}%20and%20year(NEW_DATE)%20eq%20#{year}"
      )
    end

  end
end