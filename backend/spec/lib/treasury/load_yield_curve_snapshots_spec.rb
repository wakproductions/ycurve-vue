require 'rails_helper'

describe Treasury::StoreYieldCurveSnapshots do
  context 'call' do
    subject { described_class.call(snapshots: input) }

    let(:input) do
      [
        {
          treasury_datum_id:  6841,
          yield_curve_date:   Date.new(2017,5,2),
          yield_1m:           0.7,
          yield_3m:           0.9,
          yield_6m:           1.1,
          yield_1y:           1.2,
          yield_2y:           1.3,
          yield_3y:           1.4,
          yield_5y:           1.5,
          yield_7y:           1.6,
          yield_10y:          1.7,
          yield_20y:          1.8,
          yield_30y:          2.0,
        },
        {
          treasury_datum_id:  6842,
          yield_curve_date:   Date.new(2017,5,3),
          yield_1m:           1.1,
          yield_3m:           1.2,
          yield_6m:           1.3,
          yield_1y:           1.4,
          yield_2y:           1.5,
          yield_3y:           1.6,
          yield_5y:           1.7,
          yield_7y:           1.8,
          yield_10y:          1.9,
          yield_20y:          1.95,
          yield_30y:          2.1,
        }
      ]
    end

    let(:beginning_data) do
      [
        {
          treasury_datum_id:  6840,
          yield_curve_date:   Date.new(2017,5,1),
          yield_1m:           0.67,
          yield_3m:           0.83,
          yield_6m:           0.98,
          yield_1y:           1.09,
          yield_2y:           1.28,
          yield_3y:           1.48,
          yield_5y:           1.84,
          yield_7y:           2.13,
          yield_10y:          2.33,
          yield_20y:          2.71,
          yield_30y:          3.0,
        }
      ]
    end

    let(:expected_yield_curve_snapshots_contents) do
      beginning_data + input
    end

    before do
      beginning_data.each do |bd|
        YieldCurveSnapshot.create(bd)
      end
    end

    def yield_curve_snapshots_contents
      YieldCurveSnapshot.all.map do |ycs|
        ycs.attributes.symbolize_keys.slice(*beginning_data.first.keys)
      end
    end

    it 'loads the appropriate data' do
      expect { subject }.to change { YieldCurveSnapshot.count }.by(2)
      expect(yield_curve_snapshots_contents).to eql(expected_yield_curve_snapshots_contents)
    end

  end
end