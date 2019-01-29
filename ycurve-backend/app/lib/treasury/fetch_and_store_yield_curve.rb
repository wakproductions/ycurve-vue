module Treasury
  class FetchAndStoreYieldCurve
    include Verbalize::Action

    input :month, :year

    def call
      StoreYieldCurveSnapshots.(snapshots: snapshots_from_xml).value
    end

    private

    def snapshots_from_xml
      @snapshots_from_xml ||= ParseYieldCurveFromXML.(xml: xml).value
    end

    def xml
      @xml ||= FetchYieldCurveXML.(month: month, year: year).value
    end

  end
end