class CreateBookingPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_packages do |t|
      t.string :name
      t.integer :duration
      t.decimal :retainer_fee
      t.decimal :total_cost
      t.references :booking, foreign_key: true, index: true

      t.timestamps
    end
  end
end
