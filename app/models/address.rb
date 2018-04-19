class Address < ApplicationRecord
  belongs_to :contact
  validates :country, :city, :street, presence: true,
                                      format: { with: /[a-zA-Z]{3,30}/ }
  validates :building_number, presence: true,
                              format: { with: /\A[1-9][0-9]{0,2}?\w?\b/ }
end
