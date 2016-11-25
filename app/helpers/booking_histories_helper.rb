module BookingHistoriesHelper

  def render_form_payment order, current_user
    if order.payment_method.nil?
      render partial: "booking_histories/user_payment_directly_form",
        locals: { order: order, current_user: current_user }
    else
      render partial: "booking_histories/update_user_payment_directly_form",
        locals: { order: order, user_payment_directly: order.payment_method }
    end
  end

  def payment_directly_exist? order
    order.payment_method.present?
  end
end
