
class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account Activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def welcome(user)
    @user = user
    mail to: user.email, subject: "Welcome"
  end

  def event_details(event)
  	@event = event
    @user = User.find(event.user_id)
    mail to: @user.email, subject: "Event Details"
  end

  def response_notification(response)
    @event = response.ask.event
    @ask = response.ask.ask
    @responder = User.find(response.user_id)
    @asker = User.find(response.ask.user_id)
    mail to: @asker.email, subject: "Response Notification"
  end
end