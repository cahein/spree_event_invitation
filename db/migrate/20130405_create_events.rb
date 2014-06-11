class CreateEvents < ActiveRecord::Migration
  def up
    create_table :spree_events do |t|
      t.string :title
      t.text :body
      t.date :date
      t.time :begin
      t.time :end
      t.timestamps
    end
  end

  def down
    drop_table :spree_events
  end
end
