ApiAuthentication.setup do |config|
  
  # mdca secure passphrase
  config.secret_passphrase = "my-secret_pass"

  # end point root uri
  config.app_root = "http://localhost:8100"
  
  # address to be sended by email when the user request a password recovery
  config.account_recovery_callback = "http://localhost:8100/account/recovery"
  
  # Email credentials to send the recovery password message using SMTP authentication
  config.recovery_email = "ifreelanceapp@gmail.com"
  config.recovery_email_password = "ifreelance1234"
  config.recovery_email_smtp_uri = "smtp.gmail.com"
  config.recovery_email_smtp_port = 587
  
  # login period
  config.login_days = 10 

end