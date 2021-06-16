class AddStatusToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :price, :numeric
    add_column :reservations, :start_date, :date
    add_column :reservations, :end_date, :date
  end
end
