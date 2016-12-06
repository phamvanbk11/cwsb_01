class PaymentMethodsController < ApplicationController
  before_action :load_venue
  before_action :load_payment_method, only: :destroy

  def index
    @payment_methods = @venue.payment_methods
  end

  def new
    @payment_method = @venue.payment_methods.new
  end

  def create
    @payment_method = @venue.payment_methods.new payment_method_params
    respond_to do |format|
      @payment_method.save
      format.js
    end
  end

  def destroy
    if @payment_method.destroy
      flash[:success] = t ".delete_successfully"
    else
      flash[:alert] = t ".delete_error"
    end
    redirect_to edit_venue_venue_market_path
  end

  private
  def payment_method_params
    params.require(:payment_method).permit :venue_id, :payment_type, :email
  end

  def load_payment_method
    @payment_method = @venue.payment_methods.find_by id: params[:id]
    unless @payment_method
      flash[:danger] = t ".not_found"
      redirect_to edit_venue_venue_market_path
    end
  end

  def load_venue
    @venue = Venue.find_by id: params[:venue_id]
    unless @venue
      flash[:danger] = t "venue.not_found"
      redirect_to venues_path
    end
  end
end
