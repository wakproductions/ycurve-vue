module Treasury
  class ParseYieldCurveFromXML
    include Verbalize::Action

    input :xml

    def call
      parsed_line_items
    end

    private

    def noko
      @noko ||= Nokogiri.parse(xml)
    end

    def parsed_line_items
      properties.map do |p|
        {
          treasury_datum_id:  p.xpath('d:Id').text.to_i,
          yield_curve_date:   Time.parse(p.xpath('d:NEW_DATE').text).to_date,
          yield_1m:           p.xpath('d:BC_1MONTH').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_1MONTH').text.to_f,
          yield_3m:           p.xpath('d:BC_3MONTH').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_3MONTH').text.to_f,
          yield_6m:           p.xpath('d:BC_6MONTH').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_6MONTH').text.to_f,
          yield_1y:           p.xpath('d:BC_1YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_1YEAR').text.to_f,
          yield_2y:           p.xpath('d:BC_2YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_2YEAR').text.to_f,
          yield_3y:           p.xpath('d:BC_3YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_3YEAR').text.to_f,
          yield_5y:           p.xpath('d:BC_5YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_5YEAR').text.to_f,
          yield_7y:           p.xpath('d:BC_7YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_7YEAR').text.to_f,
          yield_10y:          p.xpath('d:BC_10YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_10YEAR').text.to_f,
          yield_20y:          p.xpath('d:BC_20YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_20YEAR').text.to_f,
          yield_30y:          p.xpath('d:BC_30YEAR').attr('null').try(:text) == 'true' ? nil : p.xpath('d:BC_30YEAR').text.to_f,
        }
      end
    end

    def properties
      @properties ||= noko.xpath('//m:properties')
    end

  end
end