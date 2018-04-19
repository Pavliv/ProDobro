require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:country) }

    it { should allow_value(Faker::Address.country).for(:country) }

    it { is_expected.to validate_presence_of(:city) }

    it { should allow_value(Faker::Address.city).for(:city) }

    it { is_expected.to validate_presence_of(:street) }

    it { should allow_value(Faker::Address.street_name).for(:street) }

    it { is_expected.to validate_presence_of(:building_number) }

    it { should allow_value(Faker::Base.numerify('###A')).for(:building_number) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:contact) }
  end
end
