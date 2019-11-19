class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence:true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :password, confirmation:true
  validates :password_confirmation, presence:true 


 
  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

end

