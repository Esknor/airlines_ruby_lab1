class CreateStaffs < ActiveRecord::Migration
 
  def up
    create_table :staffs do |t|
      t.string :name, limit: 128, null: false
      t.string :profession, null: false
    end    
  end

  def down
  	drop_table :staffs
  end
end
