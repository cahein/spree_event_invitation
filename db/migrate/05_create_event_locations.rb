class CreateEventLocations < ActiveRecord::Migration[4.2]
  def up
    create_table :spree_event_locations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :zipcode
      t.string :city
    end
  end

  def down
    drop_table :spree_event_locations
  end
end
