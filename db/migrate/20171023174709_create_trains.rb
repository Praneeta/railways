class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.integer :capacity
      t.text :source
      t.text :destination
      t.text :stops

      t.timestamps
    end
  end
end
