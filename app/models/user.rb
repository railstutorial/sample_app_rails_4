class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password_confirmation, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
