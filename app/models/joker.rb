class Joker < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_many :jokes
  validates :nickname,  presence: true,
                        uniqueness: true
  validates :email,   uniqueness: true,
                      format: { :with => /\w+@\w+\.\w+/}
  validate :password, presence: true
end
