class UserPaymentDirectliesController < ApplicationController
  before_action :load_order

  def create
    @user_payment_directly = UserPaymentDirectly.new user_payment_directly_params
    if @user_payment_directly.save
      flash[:success] = t "booking_histories.choose_payment.success"
    else
      flash[:danger] = t "booking_histories.choose_payment.choose_payment_update.errors"
    end
    redirect_to booking_histories_path
  end

  private

  def user_payment_directly_params
    params.require(:user_payment_directly).permit(:name, :email,
      :address, :phone).merge! order: @order
  end

  def load_order
    @order = Order.find_by id: params[:order_id]
    unless @order
      flash[:danger] = t "orders.errors.load"
      redirect_to booking_histories_path
    end
  end
end
