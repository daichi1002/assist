class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"on87.nagano.daichi@gmail.com", subject: "お問い合わせ"
  end
end
