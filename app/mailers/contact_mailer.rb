class ContactMailer < ApplicationMailer
   def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: ENV['OWN_EMAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
