require 'rails_helper'

describe Treasury::ParseYieldCurveFromXML do
  subject { described_class.call(xml: input_xml) }

  let(:input_xml) do
    File.open(Rails.root.join('spec/support/data.treasury.gov-yield-curve-sample.xml')) { |f| f.read }
  end

  let(:expected_result_count) { 20 }
  let(:expected_first_item) do
    Utilities::ConvertHashFloatsToStrings.convert_hash_floats_to_strings(
      {
        treasury_datum_id:  6840,
        yield_curve_date:   Date.new(2017,5,1),
        yield_1m:           nil,
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
    )
  end
  let(:expected_last_item) do
    Utilities::ConvertHashFloatsToStrings.convert_hash_floats_to_strings(
      {
        treasury_datum_id:  6859,
        yield_curve_date:   Date.new(2017,5,26),
        yield_1m:           0.75,
        yield_3m:           0.94,
        yield_6m:           1.08,
        yield_1y:           1.17,
        yield_2y:           1.3,
        yield_3y:           1.46,
        yield_5y:           1.79,
        yield_7y:           2.06,
        yield_10y:          2.25,
        yield_20y:          2.65,
        yield_30y:          2.92,
      }
    )
  end

  it 'correctly parses the file' do
    result = subject.value
    expect(result.size).to eql(expected_result_count)

    expect(
      Utilities::ConvertHashFloatsToStrings.convert_hash_floats_to_strings(result.first)
    ).to eql(expected_first_item)

    expect(
      Utilities::ConvertHashFloatsToStrings.convert_hash_floats_to_strings(result.last)
    ).to eql(expected_last_item)
  end

  
end