class RemoveColumnFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :passwerd_digest, :string
    remove_column :users, :profile_image, :string
  end
end
