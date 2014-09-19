class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.text :text_one
      t.text :text_two
      t.text :text_three
      t.string :image_one
      t.string :image_two
      t.string :image_three
      t.belongs_to :joker
      t.timestamps
    end
  end
end
