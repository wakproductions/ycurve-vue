module Daemons
  module UpdateYieldCurve
    extend self

    def run
      puts "#{Time.now} - Beginning Update Yield Curve Data Daemon..."
      scheduler = Rufus::Scheduler.new

      scheduler.cron('0 20 * * *') do
        puts "#{Time.now} - Updating Yield Curve Data..."
        Treasury::FetchAndStoreYieldCurve.(month: Date.today.month, year: Date.today.year)
        puts "Yield Curve Updated - #{Time.now}"
      end
    end

  end
end