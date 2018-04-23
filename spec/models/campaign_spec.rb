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

  describe 'states' do
    let(:campaign_new) { create(:campaign_state_new) }
    let(:campaign_published) { create(:campaign_state_published) }
    let(:campaign_on_hold) { create(:campaign_state_on_hold) }
    let(:campaign_closed) { create(:campaign_state_closed) }

    context 'when state is new' do
      it { expect(campaign_new).to allow_transition_to(:published) }

      it { expect(campaign_new).to_not allow_transition_to(:on_hold) }

      it { expect(campaign_new).to_not allow_transition_to(:closed) }

      it 'makes transition to publish' do
        expect(campaign_new).to transition_from(:new).to(:published).on_event(:publish)
      end
    end

    context 'when state is published' do
      it { expect(campaign_published).to allow_transition_to(:on_hold) }

      it { expect(campaign_published).to allow_transition_to(:closed) }

      it { expect(campaign_published).to_not allow_transition_to(:new) }

      it { expect(campaign_published).to_not allow_transition_to(:published) }

      it 'makes transition from published to on_hold' do
        expect(campaign_published).to transition_from(:published).to(:on_hold).on_event(:hold)
      end

      it 'makes transition from published to closed' do
        expect(campaign_published).to transition_from(:published).to(:closed).on_event(:close)
      end
    end

    context 'when state is on_hold' do
      it { expect(campaign_on_hold).to allow_transition_to(:published) }

      it { expect(campaign_on_hold).to allow_transition_to(:closed) }

      it { expect(campaign_on_hold).to_not allow_transition_to(:new) }

      it { expect(campaign_on_hold).to_not allow_transition_to(:on_hold) }

      it 'makes transition from on_hold to closed' do
        expect(campaign_on_hold).to transition_from(:on_hold).to(:closed).on_event(:close)
      end

      it 'makes transition from on_hold to published' do
        expect(campaign_on_hold).to transition_from(:on_hold).to(:published).on_event(:publish)
      end
    end

    context 'when state is closed' do
      it { expect(campaign_closed).to_not allow_transition_to(:new) }

      it { expect(campaign_closed).to_not allow_transition_to(:published) }

      it { expect(campaign_closed).to_not allow_transition_to(:on_hold) }

      it { expect(campaign_closed).to_not allow_transition_to(:close) }
    end
  end
end
