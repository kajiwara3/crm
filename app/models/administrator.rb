class Administrator < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates :password, presence: { on: :create },
    confirmation: { allow_blank: true }

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def authenticate(email, password)
      administrator = find_by_email(email)
      if administrator && administrator.hashed_password.present? &&
        BCrypt::Password.new(administrator.hashed_password) == password
        administrator
      else
        nil
      end
    end
  end
end
