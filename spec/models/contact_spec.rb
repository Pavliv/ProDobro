require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }

    it { should allow_value(Faker::Internet.email).for(:email) }

    it { is_expected.to validate_presence_of(:phone) }

    it { should allow_value(Faker::Base.numerify('+##-###-###-##-##')).for(:phone) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:address) }
  end
end
