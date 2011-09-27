Given /^I am a registered user$/ do
  @user = User.create(:email => "foo@example.com", :password => "password", :password_confirmation => "password")
end
