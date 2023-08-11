class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :actor, foreign_key: { to_table: :users }
      t.references :notifier, foreign_key: { to_table: :users }
      t.string :type
      t.references :friendship
      t.references :comment
      t.references :like

      t.timestamps
    end
  end
end
