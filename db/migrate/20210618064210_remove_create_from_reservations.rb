class RemoveCreateFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :image, :string
    remove_column :reservations, :room_name, :string
    remove_column :reservations, :address, :string
    remove_column :reservations, :description, :text
  end
end
