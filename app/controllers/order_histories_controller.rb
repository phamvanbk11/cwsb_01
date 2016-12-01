class OrderHistoriesController < ApplicationController
  before_action :require_logged_in_user

  def index
    @orders = current_user.orders
      .recent.filter_by_payment_method(params[:payment_method_type])
      .filter_by_status(params[:status])
  end
end
