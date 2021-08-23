class AddCommentIdToReplies < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :comment_id, :bigint
  end
end
