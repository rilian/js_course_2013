class GroupsController < ApplicationController
  before_filter :load_groups

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @groups = Group.all
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      @groups = Group.all
    end
  end

  def destroy
    Group.find(params[:id]).delete
    @groups = Group.all
  end

  private

  def group_params
    params.require(:group).permit(:name, :surname, :email, :phone, :group_id)
  end

  def load_groups
    @groups = Group.all
    @group = Group.new
  end
end
