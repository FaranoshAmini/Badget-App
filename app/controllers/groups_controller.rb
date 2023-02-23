class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(gro_params)
    if @group.save
      flash[:notice] = 'Successfully created Category.'
      redirect_to groups_path
    else
      flash[:notice] = 'Invalid Category. Please try again.'
    end
  end

  private

  def gro_params
    params.require(:group).permit(:name)
  end
end
