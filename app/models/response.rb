class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  validates :response,  presence: true
  validates :user,  presence: true
  validates :ask,  presence: true

  default_scope -> { order(created_at: :desc) }
  
  def send_response_notification
    UserMailer.response_notification(self).deliver_now
  end
end
