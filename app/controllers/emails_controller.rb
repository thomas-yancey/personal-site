class EmailsController < ApplicationController

  def new
  end

  def create
    email = Email.new(message_params)
    if email.save
      ContactMailer.contact_email(email).deliver_later
      flash[:notice] = "Thanks for reaching out! I will get back to you shortly"
    else
      @errors = email.errors.full_messages
    end
    redirect_to root_path
  end

  private

  def message_params
    params.require(:email).permit(:address, :message)
  end

end
