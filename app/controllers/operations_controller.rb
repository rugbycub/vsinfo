class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @operations = Operation.all
    respond_with(@operations)
  end

  def show
    respond_with(@operation)
  end

  def new
    @operation = Operation.new
    respond_with(@operation)
  end

  def edit
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.save
    respond_with(@operation)
  end

  def update
    @operation.update(operation_params)
    respond_with(@operation)
  end

  def destroy
    @operation.destroy
    respond_with(@operation)
  end

  def determine_turns
    @turn = @operation.turns.new
    @turn.save
  end

  private
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def operation_params
      params.require(:operation).permit(:city, :date, :staff_assignment)
    end
end
