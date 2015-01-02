class AdhocCancellationsController < ApplicationController
  before_action :set_adhoc_cancellation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @adhoc_cancellations = AdhocCancellation.all
    respond_with(@adhoc_cancellations)
  end

  def show
    respond_with(@adhoc_cancellation)
  end

  def new
    @adhoc_cancellation = AdhocCancellation.new
    respond_with(@adhoc_cancellation)
  end

  def edit
  end

  def create
    @adhoc_cancellation = AdhocCancellation.new(adhoc_cancellation_params)
    @adhoc_cancellation.save
    respond_with(@adhoc_cancellation)
  end

  def update
    @adhoc_cancellation.update(adhoc_cancellation_params)
    respond_with(@adhoc_cancellation)
  end

  def destroy
    @adhoc_cancellation.destroy
    respond_with(@adhoc_cancellation)
  end

  private
    def set_adhoc_cancellation
      @adhoc_cancellation = AdhocCancellation.find(params[:id])
    end

    def adhoc_cancellation_params
      params.require(:adhoc_cancellation).permit(:date)
    end
end
