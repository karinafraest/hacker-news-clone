
class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    validates :hashed_password, presence: true

    def password
      @password ||= BCrypt::Password.create(new_password)
    end

    def password=(new_password)
      @password = BCrypt::Password.create(new_password)
      self.hashed_password = @password
    end
end
