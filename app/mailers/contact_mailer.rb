class ContactMailer < ApplicationMailer

  def contact_email(email)
    @address = email.address
    @message = email.message

    mail(to: "tomyncy618@gmail.com", subject: "Personal site message from #{@address}")

  end
end
