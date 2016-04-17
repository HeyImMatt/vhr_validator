class CreateVacationHomes < ActiveRecord::Migration
  def change
    create_table :vacation_homes do |t|
      t.integer :business_id
      t.string :business_name
      t.string :property_address
      t.integer :max_occupancy
      t.integer :parking_spaces
      t.string :refuse_day

      t.timestamps null: false
    end
  end
end
