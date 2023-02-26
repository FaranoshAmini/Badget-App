class ExpensesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new(name: exp_params[:name], amount: exp_params[:amount], user_id: current_user.id)
    if @expense.save
      flash[:notice] = 'Expense successfully completed.'
      redirect_to group_expenses_path(@group)
    else
      flash[:notice] = 'Invalid Expense!'
    end
  end

  private

  def exp_params
    params.require(:expense).permit(:name, :amount)
  end
end
