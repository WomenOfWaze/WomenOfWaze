class EnquiryMailer < ActionMailer::Base
  default :from => "wow.maitree@tcs.com"  

  def enquiry_mail(enquiry)
    @enquiry = enquiry
    requestor_name = @enquiry.firstname << " " << @enquiry.lastname
    mail(:to => User.all.map(&:email), :subject => "Enquiry From - " << requestor_name)
  end

end
