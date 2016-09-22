class Event < ActiveRecord::Base
	before_create :set_access_code
	has_many :users, through: :attendance_history

	#  has_many :event_check_ins
	#  mount_uploader :picture, PictureUploader
	validates :startDate,  presence: true
	validates :endDate,  presence: true

private
	def generate_access_code
		o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		loop do
			code = (0...6).map { o[rand(o.length)] }.join
			break code unless self.class.find_by(access_code: code)
		end
	end

	def set_access_code
		write_attribute(:access_code, generate_access_code)
	end
end
