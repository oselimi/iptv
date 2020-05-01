class User < ApplicationRecord
  before_save {self.email = email.downcase }
  validates :username,  presence: true, length: { minimum: 3, maximum: 50 },
                        uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true, format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true
  validates :telephone, presence: true
  validates :address,   presence: true
  validates :city,      presence: true
  has_secure_password
  validates :password,  presence: true, length:{ minimum: 6, maximum: 30 }

  def User.digest(string)
    cost = ActiveRecord::SecurePassword.min.cost ? BCrypt::Engine::MIN_COST :
                                                   BCrypt::Engine.cost
    BCrypt::password.create( string, cost: cost )
  end
end
