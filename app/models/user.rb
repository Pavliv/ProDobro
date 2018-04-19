class User < ApplicationRecord
  rolify
  has_many :news
  has_many :campaigns
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :surname, presence: true,
                             length: { in: 3..30 },
                             format: { with: /\A[a-zA-Z]+\z/ }
end
