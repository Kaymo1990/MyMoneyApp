class User < ApplicationRecord
    validates :username, presence: true,
        uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true
    validates :salary, presence: true
    validates :start, presence: true
    validates :end, presence: true
end
