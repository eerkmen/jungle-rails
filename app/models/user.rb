class User < ApplicationRecord
  has_secure_password
  validates :password, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    end
  end
end