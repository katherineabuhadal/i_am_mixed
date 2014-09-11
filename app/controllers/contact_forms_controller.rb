class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.valid?
      @contact_form.deliver
      flash[:success] = "Email delivered successfully"
      redirect_to :contact_confirmation
    else
      render :new
    end
  end

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
