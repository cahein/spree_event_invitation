class RenameColumnSubtitle < ActiveRecord::Migration
  def change
    rename_column :spree_events, :subtitle, :speaker
  end
end
