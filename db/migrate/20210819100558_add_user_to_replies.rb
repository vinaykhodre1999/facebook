class AddUserToReplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :replies, :user, null: false, foreign_key: true, index: true
  end
end

