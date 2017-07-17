# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do 
	config.action_mailer.delivery_method = :smpt
  	config.action_mailer.smtp_setting = {
                address: "smtp.gmail.com",
                port: 587,
                domain: "domain.of.sender.net",
                authentication: "plain",
                user_name: "dave",
                password: "secret",
                enable_starttls_auto: true
  } 
end
