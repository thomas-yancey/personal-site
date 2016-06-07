class EmailsController < ApplicationController

  def new
  end

  def create
    flash.clear
    email = Email.new(message_params)
    if email.save
      ContactMailer.contact_email(email).deliver_later
      flash[:notice] = "Thanks for reaching out! I will get back to you shortly"
      @email = Email.new
      redirect_to root_path
    else
      flash[:danger] = "Your message was unable to process, please check the following"
      @errors = email.errors.full_messages
      @email = email
      render "/welcome/index"
    end

  end

  private

  def message_params
    params.require(:email).permit(:address, :message)
  end

end
