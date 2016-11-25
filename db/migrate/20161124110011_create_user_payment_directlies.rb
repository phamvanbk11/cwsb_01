class CreateUserPaymentDirectlies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_payment_directlies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
