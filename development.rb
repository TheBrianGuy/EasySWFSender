# Mail logging and other settings
config.action_mailer.default_url_options = { :host => "localhost:3000" }
config.action.mailer.perform_deliveries = true
config.action.mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp

#Email Message
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
	address:							ENV['EMAIL_ADDRESS'],
	port:									587,
	domain:								ENV['EMAIL_DOMAIN'],
	user_name:						ENV['EMAIL_USERNAME'],
	password:							ENV['EMAIL_PASSWORD'],
	authentication:				ENV['EMAIL_AUTHENTICATION'],
	enable_starttls_auto:	true }
