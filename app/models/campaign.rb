class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 3 }
  validates :description, presence: true
  validates :current_amount, :needed_amount, presence: true,
                                             numericality: { greater_than_or_equal_to: 0 }
  validates :requisite, presence: true,
                        numericality: true,
                        length: { is: 16 },
                        format: { with: /\A\d+\z/ }

  def percent_of_collected_amount
    needed_amount.zero? ? 100 : 100 * current_amount / needed_amount
  end
end
