json.array!(@vacation_homes) do |vacation_home|
  json.extract! vacation_home, :id, :business_id, :business_name, :property_address, :max_occupancy, :parking_spaces, :refuse_day, :contact_name, :contact_email, :contact_phone
  json.url vacation_home_url(vacation_home, format: :json)
end
