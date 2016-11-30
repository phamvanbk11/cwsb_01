class BookingMailer < ApplicationMailer

  def change_status_booking state, email
    @state = state
    mail to: email, subject: t("bookings.email")
  end

  def change_status_payment_directly status, email
    @status = status
    mail to: email, subject: t("payments.directly.email")
  end
end
