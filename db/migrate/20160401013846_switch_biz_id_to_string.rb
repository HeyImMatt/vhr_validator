class SwitchBizIdToString < ActiveRecord::Migration
  def change
    change_column :vacation_homes, :business_id, :string
  end
end
