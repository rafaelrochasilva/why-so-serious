class Joke < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :joker
  validates :text_one, presence: true
  validates :text_two, presence: true
  validates :text_three, presence: true
  validates :image_one, presence: true
  validates :image_two, presence: true
  validates :image_three, presence: true
end
    # create_table :jokes do |t|
    #   t.text :text_one
    #   t.text :text_two
    #   t.text :text_three
    #   t.string :image_one
    #   t.string :image_two
    #   t.string :image_three
    #   t.belongs_to :joker
    #   t.timestamps
