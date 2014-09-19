class Joke < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :joker
  validates :joke_title, presence: true
  validates :text_one, presence: true
  validates :text_two, presence: true
  validates :text_three, presence: true
  validates :image_one, presence: true
  validates :image_two, presence: true
  validates :image_three, presence: true
end
