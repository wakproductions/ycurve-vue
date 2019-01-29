class AddUniqueIndexToYieldCurveSnapshots < ActiveRecord::Migration[5.1]
  def change
    add_index :yield_curve_snapshots, [:yield_curve_date], name: :yield_curve_snapshots_unique, unique: true
  end
end
