class CreateImageJokes < ActiveRecord::Migration
  def change
    create_table :image_jokes do |t|
      t.belongs_to :image
      t.belongs_to :joke
      t.timestamps
    end
  end
end
