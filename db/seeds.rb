# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create!(firstName:  "Bev",
	       lastName: 	"Leu",
             email: "bevali@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             activated_at: Time.zone.now,
             activated: true,
             admin: true)


@event = Event.create!(name:  "Rails Meetup",
             startDate: Time.today,
             endDate: Time.today + 1,
             user: @user)