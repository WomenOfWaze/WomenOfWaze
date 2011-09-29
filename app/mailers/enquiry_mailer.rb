class EnquiryMailer < ActionMailer::Base
  default from: "wow.maitree@tcs.com"

  TO_EMAIL = "womenofwaze@gmail.com" #wow.maitree@tcs.com

  def enquiry_mail(enquiry)
    @enquiry = enquiry
    requestor_name = @enquiry.firstname << " " << @enquiry.lastname
    User.all.each do |user|
      mail(:to => user.email, :subject => "Enquiry From - " << requestor_name)
    end
  end

end
