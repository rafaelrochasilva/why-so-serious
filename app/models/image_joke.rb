class ImageJoke < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :joke
  belongs_to :image
end
