require 'spec_helper'

describe GroupsController do
  describe 'GET index' do
    before do
      @group_1 = Group.create(name: 'a')
      @group_2 = Group.create(name: 'b')
    end

    it 'renders existing groups' do
      get :index

      expect(response.status).to eq 200
      expect(assigns(:groups)).to match_array([@group_1, @group_2])
    end
  end

  describe 'GET new' do
    it 'assigns empty Group' do
      get :new

      expect(response.status).to eq 200
      expect(assigns(:group).class).to eq Group
    end
  end

  describe 'POST create' do
    it 'creates Group' do
      xhr :post, :create, { group: { name: 'a' } }

      expect(response.status).to eq 200
      expect(Group.count).to eq 1
      expect(Group.first.name).to eq 'a'
    end
  end

  describe 'GET edit' do
    before do
      @group = Group.create(name: 'a')
    end

    it 'assigns existing Group' do
      get :edit, id: @group.id

      expect(response.status).to eq 200
      expect(assigns(:group)).to eq @group
    end
  end

  describe 'PUT update' do
    before do
      @group = Group.create(name: 'a')
    end

    it 'updates Group' do
      xhr :put, :update, { id: @group.id, group: { name: 'b' } }

      expect(response.status).to eq 200
      expect(Group.count).to eq 1
      expect(Group.first.name).to eq 'b'
    end
  end

  describe 'DELETE destroy' do
    before do
      @group = Group.create(name: 'a')
    end

    it 'deletes Group' do
      xhr :delete, :destroy, { id: @group.id }

      expect(response.status).to eq 200
      expect(Group.count).to eq 0
    end
  end
end
