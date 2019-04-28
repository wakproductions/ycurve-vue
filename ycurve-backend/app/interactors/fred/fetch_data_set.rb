require 'net/http'

module FRED
  class FetchDataSet
    include Verbalize::Action

    input :dataset_url

    def call
      HTTParty.get(dataset_url, follow_redirects: true)
    end

  end
end
