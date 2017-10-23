class AddDaysToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :train_schedules, :days, :string
  end
end
