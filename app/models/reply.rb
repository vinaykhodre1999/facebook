class Reply < ApplicationRecord
	belongs_to :comment, foreign_key: :comment_id
	belongs_to :user
end
