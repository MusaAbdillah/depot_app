ActionMailer::Base.register_interceptor(SendGrid::MailInterceptor)

  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '25',
    :domain => 'benefique-chaise-68456.herokuapp.com',
    :authentication => :plain,
    :user_name => Rails.application.secrets.sendgrid_username,
    :password => Rails.application.secrets.sendgrid_password
  }

  SendGrid.configure do |config|
    config.dummy_recipient = 'noreply@example.com'
  end