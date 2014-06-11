class AddSubtitle < ActiveRecord::Migration
  def up
    add_column :spree_events, :subtitle, :string
  end

  def down
    remove_column :spree_events, :subtitle
  end
end
