require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to validate_length_of(:title).is_at_least(3) }

    it { is_expected.to validate_uniqueness_of(:title) }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:current_amount) }

    it { is_expected.to validate_numericality_of(:current_amount) }

    it { is_expected.to_not allow_value(-1).for(:current_amount) }

    it { is_expected.to validate_presence_of(:needed_amount) }

    it { is_expected.to validate_numericality_of(:needed_amount) }

    it { is_expected.to_not allow_value(-1).for(:needed_amount) }

    it { is_expected.to validate_presence_of(:requisite) }

    it { is_expected.to validate_numericality_of(:requisite) }

    it { is_expected.to validate_length_of(:requisite).is_equal_to(16) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
