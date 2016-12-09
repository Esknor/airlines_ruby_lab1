class JoinTableFlightsStaffs < ActiveRecord::Migration
  def change
  	create_join_table :flights, :staffs
  end
end
