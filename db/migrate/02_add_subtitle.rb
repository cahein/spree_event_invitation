class AddSubtitle < ActiveRecord::Migration[4.2]
  def up
    add_column :spree_events, :subtitle, :string
  end

  def down
    remove_column :spree_events, :subtitle
  end
end
