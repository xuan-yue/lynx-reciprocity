class User < ActiveRecord::Base

  attr_accessor :remember_token, :activation_token, :reset_token, :invitation_token
  before_save   :downcase_email #, :create_profile
  before_create :create_activation_digest
  #mount_uploader :picture, PictureUploader

  #validates :terms_of_service, acceptance: true
  validates :firstName,  presence: true, length: { maximum: 50 }
  validates :lastName,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  #validates :dob,  presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  VALID_PHONE_REGEX = /(1?[ -.]?\(?\d{3}\)?[ -.]?\d{3}[ -.]?\d{4}[ extension\.]*\d{0,5})/i
  validates :phone, length: { maximum: 50 },
                    format: { with: VALID_PHONE_REGEX, message: "format is invalid"  }, 
                    presence: true,  
                    :on => :update
  validates :street1, presence: true,  
                    :on => :update
  validates :city, presence: true,  
                    :on => :update
  validates :state, presence: true,  
                    :on => :update
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 },
                    :on => :update
  before_validation :format_phone

  def city=(s)
    write_attribute(:city, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end

  def firstName=(s)
    write_attribute(:firstName, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end
  
  def lastName=(s)
    write_attribute(:lastName, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end
  
  def street1=(s)
    write_attribute(:street1, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end
  
  def street2=(s)
    write_attribute(:street2, s.to_s.titleize) # The to_s is in case you get nil/non-string
  end

  def self.ransack(search)
    if search
      find(:all, :conditions => ['firstName LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  #strip non-numerical characters from phone number
  def format_phone
    if @phone != nil
      @phone = self.phone.scan(/[0-9]/).join
      self.phone = @phone.length == 7 ? ActionController::Base.helpers.number_to_phone(@phone) : 
      @phone.length == 10 ? ActionController::Base.helpers.number_to_phone(@phone, area_code: true) :
      @phone

    end
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end  

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_welcome_email
    if self.user_type == "Coach"
      UserMailer.welcome_coach(self).deliver_now
    else
      UserMailer.welcome_athlete(self).deliver_now
    end 
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end


end