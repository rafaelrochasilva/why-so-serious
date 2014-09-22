class Joke < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :joker
  has_many :image_jokes
  has_many :images, through: :image_jokes


  validates :joke_title, presence: true
  validates :text_one, presence: true
  validates :text_two, presence: true
  validates :text_three, presence: true
end


