class Image < ActiveRecord::Base
  # Remember to create a migration!
  has_many :image_jokes
  has_many :jokes, through: :image_jokes
end
