class User < ApplicationRecord
  has_many :news
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :surname, presence: true,
                             length: { in: 3..30 },
                             format: { with: /\A[a-zA-Z]+\z/ }
end
