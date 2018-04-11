class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :surname, presence: true,
                             length: { in: 3..30 },
                             format: { with: /\A[a-zA-Z]+\z/ }
  validates :phone_number, presence: true,
                           numericality: true,
                           length: { is: 13 }
end
