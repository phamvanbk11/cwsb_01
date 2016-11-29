class PaymentMethod < ApplicationRecord
  belongs_to :venue

  validates :payment_type, presence: true
  validates :email, presence: true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, if: :paypal?

  enum payment_type: {directly: 0, paypal: 1, banking: 2}
end
