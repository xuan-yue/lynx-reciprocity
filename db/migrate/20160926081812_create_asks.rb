class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :ask
      t.text :details

      t.timestamps null: false
    end
    add_foreign_key :asks, :users
    add_foreign_key :asks, :events
  end
end
