class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image, :dependent => :destroy

  validates :dob, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
