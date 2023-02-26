class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    p gro_params
    p current_user.id
    # @group = Group.new(name: params[:group][:name], icon: params[:group][:icon], author: current_user)
    @group = Group.new(gro_params)
    @group.user_id = current_user.id
    if @group.save
      p 'save method'
      # flash[:notice] = 'Successfully created Category.'
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      p 'not save'
      flash[:notice] = 'Invalid Category. Please try again.'
    end
  end

  private

  def gro_params
    params.require(:group).permit(:name, :icon)
  end
end
