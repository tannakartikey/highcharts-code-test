class ApplicationMailer < ActionMailer::Base
  default from: '"Deauthorized" <noreply@Deauthorized.com>'
  layout 'mailer'

  def self.inherited(subclass)
    subclass.default template_path: "mailers/#{subclass.name.underscore}"
  end
end
