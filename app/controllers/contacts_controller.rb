class ContactsController < ApplicationController
  before_filter :load_contacts

  def index
    @q = Contact.search(params[:q])
    @contacts = @q.result
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      @contacts = Contact.all
    end
  end

  def destroy
    Contact.find(params[:id]).delete
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :surname, :email, :phone, :group_id)
  end

  def load_contacts
    @contacts = Contact.all
    @contact = Contact.new
  end
end
