class AddPeopleToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :people, :numeric
  end
end
