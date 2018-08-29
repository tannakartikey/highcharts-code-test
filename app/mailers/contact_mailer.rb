class ContactMailer < ApplicationMailer
  def lead_email(contact)
    @contact = contact
    mail(to: %w(reza@Deauthorized.com), from: 'noreply@Deauthorized.com', subject: 'Deauthorized Website Lead')
  end
end
