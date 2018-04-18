require 'rails_helper'

RSpec.describe(News, type: :model) do
  let(:news) { create(:news) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:title) }

    it { is_expected.to validate_length_of(:title).is_at_least(3) }

    it { is_expected.to belong_to(:user) }
  end
end
