class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :surname, presence: true,
                             length: { in: 3..30 },
                             format: { with: /\A[a-zA-Z]+\z/ },
                             unless: :skip_register_validation
  validates :phone_number, presence: true,
                           numericality: true,
                           length: { is: 13 },
                           unless: :skip_register_validation

  attr_accessor :skip_register_validation
end
