class CreateYieldCurveSnapshots < ActiveRecord::Migration[5.1]
  def change
    create_table :yield_curve_snapshots do |t|
      t.integer :treasury_datum_id
      t.date :yield_curve_date
      t.float :yield_1m
      t.float :yield_3m
      t.float :yield_6m
      t.float :yield_1y
      t.float :yield_2y
      t.float :yield_3y
      t.float :yield_5y
      t.float :yield_7y
      t.float :yield_10y
      t.float :yield_20y
      t.float :yield_30y

      t.timestamps
    end
  end
end
