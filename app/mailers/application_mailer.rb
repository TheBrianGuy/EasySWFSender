class ApplicationMailer < ActionMailer::Base
  # default from: "from@example.com",
  default from: ENV['EMAIL_DEFAULT_FROM'],
  layout 'mailer'
end
