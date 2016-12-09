class CreateFlights < ActiveRecord::Migration
  def up
    create_table :flights do |t|
      t.string	:num, limit: 7, null: false
      t.string	:fromFlight, limit: 128, default: 'Unknown'
      t.string	:toFlight, limit: 128, default: 'Unknown'
      t.boolean	:status, default: 0
    end
  end

  def down
  	drop_table :flights
  end
end
