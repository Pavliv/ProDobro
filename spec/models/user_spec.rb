require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(30) }

    it { is_expected.to validate_presence_of(:surname) }

    it { is_expected.to validate_length_of(:surname).is_at_least(3).is_at_most(30) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:campaigns) }

    it { is_expected.to have_many(:news) }

    it { is_expected.to have_one(:image) }
  end
end
