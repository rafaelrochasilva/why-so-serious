class Joker < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  has_many :jokes
  validates :nickname,  presence: true,
                        uniqueness: true
  validates :email,   uniqueness: true,
                      format: { :with => /\w+@\w+\.\w+/}
  validate :password, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(user_info)
    email = user_info[:email]
    password = user_info[:password]

    joker = Joker.find_by_email(email)
    return joker if joker && joker.password == password
    nil
  end
end
