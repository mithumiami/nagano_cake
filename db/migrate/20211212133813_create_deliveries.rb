class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|

      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
