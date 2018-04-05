require 'rails_helper'

RSpec.describe(News, type: :model) do
  let(:news) { create(:news) }

  context 'when description and title fields are empty' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'when title field is minimum length' do
    it { is_expected.to validate_length_of(:title).is_at_least(3) }
  end

  context 'when user created news' do
    it { is_expected.to belong_to(:user) }
  end
end
