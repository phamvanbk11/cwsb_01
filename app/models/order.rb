class Order < ApplicationRecord
  after_create :update_booking

  attr_accessor :booking_ids

  belongs_to :coupon
  belongs_to :venue
  belongs_to :payment_method, polymorphic: true

  has_one :payment

  has_many :bookings, dependent: :destroy

  enum status: {requested: 0, pending: 1, paid: 2, closed: 3}

  scope :have_order_payment_directly, -> do
    where payment_method_type: UserPaymentDirectly.name
  end
  scope :recent, ->{order :created_at}

  scope :filter_by_payment_method, ->payment_method_type do
    where payment_method_type: payment_method_type if payment_method_type.present?
  end
  scope :filter_by_status, ->status do
    where status: status if status.present?
  end

  def update_booking
    @booking_ids = booking_ids.split(" ")
    @booking_ids.each do |booking_id|
      booking = Booking.find_by id: booking_id
      booking.update_attributes order_id: self.id, state: "requested"
    end
  end
end
