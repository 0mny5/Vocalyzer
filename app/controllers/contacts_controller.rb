class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to request.referer, success: t('.success')
    end
  end

  private

  def contact_params
    params.permit(:id, :name, :email, :content)
  end
end
