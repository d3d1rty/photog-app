class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :duration
      t.decimal :retainer_fee
      t.decimal :total_cost
      t.text :description
      t.references :package_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
