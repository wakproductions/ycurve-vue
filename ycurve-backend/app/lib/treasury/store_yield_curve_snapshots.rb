module Treasury
  class StoreYieldCurveSnapshots
    include Verbalize::Action

    input :snapshots

    def call
      snapshots.each do |ycs|
        YieldCurveSnapshot.create(ycs) unless YieldCurveSnapshot.find_by(yield_curve_date: ycs[:yield_curve_date])
      end
    end
  end
end