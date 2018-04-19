class Contact < ApplicationRecord
  has_one :address
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ },
                    presence: true
  validates :phone, format: { with: /\A[+]\d{2}-\d{3}-\d{3}-\d{2}-\d{2}/ },
                    presence: true
end
