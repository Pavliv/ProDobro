class DeviseCustomMailer < Devise::Mailer
  default template_path: 'devise/mailer'
  layout 'mailer'
end
