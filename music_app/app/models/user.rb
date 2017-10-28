class User < ApplicationRecord
  validates :email,:password_digest,:session_token, presence: true


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def find_by_credentials(email,password)
    @user = User.find_by(email: email)
    return nil unless @user
    if @user.is_password?(password)
      @user
    else
      nil
    end
  end


  def self.generate_session_token
    SecureRandom::base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
