

# 3-month Treasuries

```ruby
# 3-month Treasury
# 1954-1990, https://fred.stlouisfed.org/series/DTB3
csv = CSV.open(Rails.root.join('data', 'DTB3.csv'), headers: true)
csv.each do |line|
  date = Date.parse(line['DATE'])
  rate = line['DTB3'].to_f  

  if rate > 0
    r = YieldCurveSnapshot.find_or_create_by(yield_curve_date: date)
    r.yield_3m = rate
    r.save  
  end
end

def smooth_data_gaps
  # Go through each record and fill in nil's with most recently recorded price
end
```