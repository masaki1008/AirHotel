class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :room_name
      t.string :address
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
