class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: true, case_sensitive: false

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("lower(email) = ?", email.downcase).first
    if (user && user.authenticate(password))
      return user
    end
    nil
  end

end
