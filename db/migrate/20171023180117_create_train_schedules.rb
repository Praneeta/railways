class CreateTrainSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :train_schedules do |t|
      t.text :departs
      t.text :arrives
      t.datetime :departs_time
      t.datetime :arrives_time
      t.references :train, foreign_key: true

      t.timestamps
    end
  end
end
