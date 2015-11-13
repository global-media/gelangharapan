class ApplicationMailer < ActionMailer::Base
  helper :accounts
  default from: "no-reply@gelangharapan.org"
  layout 'mailer'
end
