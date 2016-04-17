class AddPhoneAndEmailColumns < ActiveRecord::Migration
  def change
    add_column :vacation_homes, :contact_name, :string
    add_column :vacation_homes, :contact_email, :string
    add_column :vacation_homes, :contact_phone, :string
  end
end
