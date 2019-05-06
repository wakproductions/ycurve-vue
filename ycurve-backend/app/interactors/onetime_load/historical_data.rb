# From Rails console:
#   load 'data/load_historical_data.rb'
#   OnetimeLoad::HistoricalData.call
#   OnetimeLoad::HistoricalData.smooth_data_gaps

module OnetimeLoad
  class HistoricalData
    include Verbalize::Action

    # Earliest date where we can get economic data from the Treasury. This interactor is to backfill old data.
    # https://www.treasury.gov/resource-center/data-chart-center/interest-rates/pages/textview.aspx?data=yield
    TREASURY_GOV_LOWER_LIMIT = Date.new(1990, 1, 2)

    def call
      import_3month_treasury_daily
      import_3month_treasury_monthly
      import_6month_treasury_daily_cmt
      import_6month_treasury_daily
      import_1year_treasury_daily_cmt
      import_1year_treasury_monthly
      import_2year_treasury_daily
      import_3year_treasury_daily
      import_3year_treasury_monthly
      import_5year_treasury_daily
      import_5year_treasury_monthly
      import_7year_treasury_daily
      import_10year_treasury_daily
      import_10year_treasury_monthly
      import_20year_treasury_monthly
      import_30year_treasury_daily
    end

    def import_3month_treasury_daily_cmt
      csv = CSV.open(Rails.root.join('data', 'DGS3MO.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS3MO'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_3m ||= rate
          r.save
        end
      end
    end


    def import_3month_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DTB3.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DTB3'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_3m ||= rate
          r.save
        end
      end
    end

    def import_3month_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'TB3MS.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['TB3MS'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_3m ||= rate
          r.save
        end
      end
    end

    def import_6month_treasury_daily_cmt
      csv = CSV.open(Rails.root.join('data', 'DGS6MO.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS6MO'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_6m ||= rate
          r.save
        end
      end
    end

    def import_6month_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DTB6.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DTB6'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_6m ||= rate
          r.save
        end
      end
    end

    def import_1year_treasury_daily_cmt
      csv = CSV.open(Rails.root.join('data', 'DGS1.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS1'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_1y ||= rate
          r.save
        end
      end
    end

    def import_1year_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'GS1.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['GS1'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_1y ||= rate
          r.save
        end
      end
    end

    def import_2year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS2.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS2'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_2y ||= rate
          r.save
        end
      end
    end

    def import_3year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS3.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS3'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_3y ||= rate
          r.save
        end
      end
    end

    def import_3year_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'GS3.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['GS3'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_3y ||= rate
          r.save
        end
      end
    end

    def import_5year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS5.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS5'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_5y ||= rate
          r.save
        end
      end
    end

    def import_5year_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'GS5.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['GS5'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_5y ||= rate
          r.save
        end
      end
    end

    def import_7year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS7.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS7'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_7y ||= rate
          r.save
        end
      end
    end

    def import_10year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS10.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS10'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_10y ||= rate
          r.save
        end
      end
    end

    def import_10year_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'GS10.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['GS10'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_10y ||= rate
          r.save
        end
      end
    end

    def import_20year_treasury_monthly
      csv = CSV.open(Rails.root.join('data', 'GS20.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['GS20'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_20y ||= rate
          r.save
        end
      end
    end

    def import_30year_treasury_daily
      csv = CSV.open(Rails.root.join('data', 'DGS30.csv'), headers: true)
      csv.each do |line|
        date = Date.parse(line['DATE'])
        rate = line['DGS30'].to_f

        if rate > 0 && date < TREASURY_GOV_LOWER_LIMIT
          r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
          r.yield_30y ||= rate
          r.save
        end
      end
    end

    def self.smooth_data_gaps
      fields = [
        :yield_1m,
        :yield_3m,
        :yield_6m,
        :yield_1y,
        :yield_2y,
        :yield_3y,
        :yield_5y,
        :yield_7y,
        :yield_10y,
        :yield_20y,
        :yield_30y,
      ]
      days_no_value_counter = Hash.new(0)
      most_recent_rate = {}

      # Go through each record and fill in nil's with most recently recorded price
      YieldCurveSnapshot.where('yield_curve_date < ?', Date.new(1990,1,2)).order(:yield_curve_date).each do |ycs|
        fields.each do |field|
          last_rate = ycs.send(field)
          if last_rate.nil?
            days_no_value_counter[field] = days_no_value_counter[field] + 1
            ycs.send("#{field}=", most_recent_rate[field]) if days_no_value_counter[field] < 32
          else
            days_no_value_counter[field] = 0
            most_recent_rate[field] = last_rate
          end
          ycs.save!
        end
      end
    end

  end
end