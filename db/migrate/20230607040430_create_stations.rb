class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :walking_minutes

      t.timestamps
    end
  end
end
