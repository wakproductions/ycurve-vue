class CreateRecessions < ActiveRecord::Migration[5.2]
  def change
    create_table :recessions do |t|
      t.string :name
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
