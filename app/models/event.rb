class Event < ActiveRecord::Base
	before_create :set_access_code
	has_many :users, through: :attendance_histories
	has_many :attendance_histories
	has_many :asks
	belongs_to :user

	#  has_many :event_check_ins
	#  mount_uploader :picture, PictureUploader
	validates :startDate,  presence: true
	validates :endDate,  presence: true

  # def to_param
  #   "#{name}-#{access_code}"
  # end

  def send_event_details
    UserMailer.event_details(self).deliver_now
  end
private


	def generate_access_code
		o = [('A'..'Z')].map { |i| i.to_a }.flatten
		loop do
			code = (0...6).map { o[rand(o.length)] }.join
			break code unless self.class.find_by(access_code: code)
		end
	end

	def set_access_code
		write_attribute(:access_code, generate_access_code)
	end
end
