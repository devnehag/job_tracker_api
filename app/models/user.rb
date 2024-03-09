class User < ApplicationRecord
    self.primary_key = 'user_id'
    has_many :jobs,dependent: :destroy
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    def self.authenticate(name, password)
      user = find_by(name: name)
      return user if user && user.authenticate(password)
    end
end
