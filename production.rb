# Mail info for production 
config.action_mailer.default_url_options = { :host => "EMAIL_HOST" }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
	address:							ENV['EMAIL_ADDRESS'],
	port:									587,
	domain:								ENV['EMAIL_DOMAIN'],
	user_name:						ENV['EMAIL_USERNAME'],
	password:							ENV['EMAIL_PASSWORD'],
	authentication:				ENV['EMAIL_AUTHENTICATION'],
	enable_starttls_auto:	true,
	tls:									true }

