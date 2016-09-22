class CreateAttendanceHistories < ActiveRecord::Migration
  def change
    create_table :attendance_histories do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end

    add_foreign_key :attendance_histories, :users
    add_foreign_key :attendance_histories, :events
  end
end
