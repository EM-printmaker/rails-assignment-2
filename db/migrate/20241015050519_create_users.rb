class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :passwerd_digest
      t.string :profile_image
      t.text :self_introduction

      t.timestamps
    end
  end
end
