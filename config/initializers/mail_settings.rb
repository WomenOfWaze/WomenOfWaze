ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'tcs.com',
  :user_name            => 'womenofwaze',
  :password             => 'womenofwaze123',
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}

