class RemoveColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_digest, :string
    remove_column :users, :profile_image, :string
    remove_column :rooms, :room_image, :string
  end
end
