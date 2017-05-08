class User < ApplicationRecord
    has_many :posts, foreign_key: :author_id

    validates :username, presence: true, uniqueness: true
    validates :hashed_password, presence: true

    def password
      @password ||= BCrypt::Password.create(new_password)
    end

    def password=(new_password)
      @password = BCrypt::Password.create(new_password)
      self.hashed_password = @password
    end

    def self.authenticate(username, given_password)
      user = User.find_by(username: username)
      if !user.nil? && user.password = given_password
        return user
      end
      return nil
    end
end
