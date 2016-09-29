class Ask < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  has_many :responses

  validates :ask,  presence: true
  validates :user,  presence: true
  validates :event,  presence: true
  
  default_scope -> { order(created_at: :desc) }
end
