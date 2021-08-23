class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :replies, dependent: :destroy
  validates :commenter, presence: true
  validates :body, presence: true
end
