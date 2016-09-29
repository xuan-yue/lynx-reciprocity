class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true
      t.references :ask, index: true
      t.string :response

      t.timestamps null: false
    end
    add_foreign_key :responses, :users
    add_foreign_key :responses, :asks
  end
end
