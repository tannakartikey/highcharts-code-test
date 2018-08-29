class Contact < ApplicationRecord
  # after_crealte :send_lead_email

  private

  def send_lead_email
    ContactMailer.lead_email(self).deliver_later
  end
end
