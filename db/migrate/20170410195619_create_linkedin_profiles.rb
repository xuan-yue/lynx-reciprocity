class CreateLinkedinProfiles < ActiveRecord::Migration
  def change
    create_table :linkedin_profiles do |t|
      t.string :email
      t.string :image_url
      t.string :profile_url
      t.text :raw_data

      t.timestamps null: false
    end
  end
end
