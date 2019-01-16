class ChangeTypes < ActiveRecord::Migration[4.2]
  def up
    change_column :spree_events, :begin, :string
    change_column :spree_events, :end, :string
  end

  def down
    change_column :spree_events, :begin, :time
    change_column :spree_events, :end, :time
  end
end
