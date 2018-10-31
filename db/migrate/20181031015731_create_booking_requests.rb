class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.datetime :requested_date
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
