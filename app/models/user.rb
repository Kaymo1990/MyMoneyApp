class User < ApplicationRecord
    before_save { self.username = username.downcase! }
    validates :username, presence: true,
        uniqueness: { case_sensitive: false }
        validates :salary, presence: true
        validates :start, presence: true
        validates :end, presence: true
        validates :password_digest, presence: true, length: { minimum: 6 }
    has_secure_password
end
