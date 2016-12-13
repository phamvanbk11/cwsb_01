module OrderHistoriesHelper

  def display_status order
    case
    when order.requested?
      Settings.span_warning
    when order.pending?
      Settings.span_info
    when order.paid?
      Settings.span_success
    else
      Settings.span_danger
    end
  end

  def render_payment_detail_type order
    case order.payment_detail_type
    when Settings.payment_methods_filter[:directly]
      t ".directly"
    when Settings.payment_methods_filter[:paypal]
      t ".paypal"
    when Settings.payment_methods_filter[:banking]
      t ".banking"
    else
      t ".undefined"
    end
  end
end
