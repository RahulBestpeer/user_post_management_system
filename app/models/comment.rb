class Comment < ApplicationRecord
  belongs_to :post

  validates :title, presence: true
end
