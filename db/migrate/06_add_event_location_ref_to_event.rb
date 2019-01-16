class AddEventLocationRefToEvent < ActiveRecord::Migration[4.2]
  def change
    add_reference :spree_events, :event_location
  end
end
