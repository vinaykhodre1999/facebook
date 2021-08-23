class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy 
  has_many :comments, dependent: :destroy 
  has_many :replies, dependent: :destroy 
  has_one :profile, dependent: :destroy 

  accepts_nested_attributes_for :profile
  after_create :new_user
  def new_user
    UserMailer.new_user(self).deliver
  end

end
