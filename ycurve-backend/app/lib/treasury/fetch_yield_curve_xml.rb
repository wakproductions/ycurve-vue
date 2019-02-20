require 'net/http'

module Treasury
  class FetchYieldCurveXML
    include Verbalize::Action

    input :month, :year

    def call
      HTTParty.get(api_uri, follow_redirects: true)
    end

    private

    def api_uri
      @api_url ||= URI.parse(
        URI::encode("http://data.treasury.gov/feed.svc/DailyTreasuryYieldCurveRateData?$filter=month(NEW_DATE) eq #{month} and year(NEW_DATE) eq #{year}")
      )
    end

  end
end