class AttendanceHistory < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user, :scope => :event

  validates :user,  presence: true
  validates :event,  presence: true
end
