require 'spec_helper'

describe ContactsController do
  describe 'GET index' do
    before do
      @contact_1 = Contact.create(name: 'a', surname: 'b', email: 'c@example.com', phone: '0')
      @contact_2 = Contact.create(name: 'd', surname: 'e', email: 'f@example.com', phone: '1')
    end

    it 'renders existing contacts' do
      get :index

      expect(response.status).to eq 200
      expect(assigns(:contacts)).to match_array([@contact_1, @contact_2])
    end
  end

  describe 'GET new' do
    it 'assigns empty Contact' do
      get :new

      expect(response.status).to eq 200
      expect(assigns(:contact).class).to eq Contact
    end
  end

  describe 'POST create' do
    it 'creates Contact' do
      xhr :post, :create, { contact: { name: 'a', surname: 'b', email: 'c@example.com', phone: '0' } }

      expect(response.status).to eq 200
      expect(Contact.count).to eq 1
      expect(Contact.first.name).to eq 'a'
    end
  end

  describe 'GET edit' do
    before do
      @contact = Contact.create(name: 'a', surname: 'b', email: 'c@example.com', phone: '0')
    end

    it 'assigns existing Contact' do
      get :edit, id: @contact.id

      expect(response.status).to eq 200
      expect(assigns(:contact)).to eq @contact
    end
  end

  describe 'PUT update' do
    before do
      @contact = Contact.create(name: 'a', surname: 'b', email: 'c@example.com', phone: '0')
    end

    it 'updates Contact' do
      xhr :put, :update, { id: @contact.id, contact: { name: 'b' } }

      expect(response.status).to eq 200
      expect(Contact.count).to eq 1
      expect(Contact.first.name).to eq 'b'
    end
  end

  describe 'DELETE destroy' do
    before do
      @contact = Contact.create(name: 'a', surname: 'b', email: 'c@example.com', phone: '0')
    end

    it 'deletes Contact' do
      xhr :delete, :destroy, { id: @contact.id }

      expect(response.status).to eq 200
      expect(Contact.count).to eq 0
    end
  end
end
