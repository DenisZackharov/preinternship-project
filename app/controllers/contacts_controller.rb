class ContactsController < ApplicationController
  before_action :contact_params, only: %i(create)

  def index
    @contact = ContactMailer.new
  end

  def create
    @contact = ContactMailer.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.notice = "Thank you for your message. I'll get back to you soon!"
      redirect_to root_path
    else
      flash.notice = "Message did not send."
      render :index
    end
  end

  private
  def contact_params
    params.require(:contact_mailer).permit(:name, :email, :message)
  end
end
