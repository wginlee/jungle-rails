class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    User.find_by_email(email.strip.downcase).try(:authenticate, password)
  end

end
