class VacationHome < ActiveRecord::Base
  require 'csv'

# Method for searching the VHR database
# TO DO - Implement better searh mechanism like elasticsearch
  def self.search(search)
    where("property_address LIKE ?", "%#{search}%")
  end

# Method for importing VHR csv files into our database
  def self.import(file)
    # Future to do: add a header check to ensure that our headers in the csv import are what we expect so we don't blow up our data
    CSV.foreach(file.path, headers: true) do |row|
      vacation_home = find_or_initialize_by(business_id: row['business_id']) # (knowledge nugget for matt: biz_id refs our db then row:biz_id refs our csv file)
      vacation_home.attributes =  {
        business_id: row['business_id'],
        business_name: row['business_name'],
        property_address: row['property_address'],
        max_occupancy: row['max_occupancy'],
        parking_spaces: row['parking_spaces'],
        refuse_day: row['refuse_day'],
        contact_name: row['contact_name'],
        contact_email: row['contact_email'],
        contact_phone: row['contact_phone']
      }
      vacation_home.save!
    end
  end

end
