class CreateJokers < ActiveRecord::Migration
  def change
    create_table :jokers do |t|
      t.string :email
      t.string :nickname
      t.string :password_digest
      t.timestamps
    end
  end
end
