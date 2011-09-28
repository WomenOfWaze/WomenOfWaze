module EnquiriesHelper
  def complete_phone_number enquiry
    "#{enquiry.phone_country_code}-#{enquiry.phone_city_code}-#{enquiry.phone_number}"
  end

  def fullname enquiry
    "#{enquiry.firstname.capitalize} #{enquiry.lastname.capitalize}"
  end
end
