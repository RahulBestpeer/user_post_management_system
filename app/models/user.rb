class User < ApplicationRecord
  has_many :posts,  dependent: :destroy
  has_many :comments, through: :posts


  validates :name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :password, presence:true
end
