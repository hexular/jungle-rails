ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.servername.com",
  :port => 587,
  :domain => "abc.com",
  :user_name => "username",
  :password => "password",
  :authentication => "plain",
  :enable_strattls_auto => true
}