class AddUserToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :user, null: false, foreign_key: true, index: true
  end
end

