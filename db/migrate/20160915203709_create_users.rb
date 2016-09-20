class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :firstName
      t.string :lastName
      t.string :phone
      t.string :email
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :profession
      t.string :company
      t.string :description
      t.string :picture
      t.string :linkedin_url

      t.boolean :admin, default: false

      t.string :activation_digest
      t.boolean :activated, default: false
      t.datetime :activated_at

      t.string :reset_digest
      t.datetime :reset_sent_at

      t.timestamps null: false
    end
  end
end
