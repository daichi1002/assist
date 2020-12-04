class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"d.nagano1002@gmail.com", subject: "お問い合わせ"
  end
end
