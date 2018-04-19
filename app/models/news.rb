class News < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  paginates_per 6
end
