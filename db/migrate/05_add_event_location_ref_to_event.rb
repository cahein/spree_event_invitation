class AddEventLocationRefToEvent < ActiveRecord::Migration
  def change
    add_reference :spree_events, :event_location
  end
end
