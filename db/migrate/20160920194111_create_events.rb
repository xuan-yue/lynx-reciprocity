class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :picture
      t.string :url
      t.string :access_code, unique: true
      t.datetime :startDate
      t.datetime :endDate

      t.timestamps null: false
    end
  end
end
