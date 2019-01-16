class RenameColumnSubtitle < ActiveRecord::Migration[4.2]
  def change
    rename_column :spree_events, :subtitle, :speaker
  end
end
