class News < ApplicationRecord
  has_one :image, as: :imageable
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  paginates_per 6
end
