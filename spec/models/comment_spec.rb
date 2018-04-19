require 'rails_helper'

RSpec.describe(Comment, type: :model) do
  let(:comment) { create(:comment) }

  context 'when body field is empty' do
    it { is_expected.to validate_presence_of(:body) }
  end

  context 'when user created comment to news' do
    it { is_expected.to belong_to(:commentable) }
    it { is_expected.to belong_to(:user) }
  end

  context 'if comment is polymorphic' do
    it { is_expected.to have_db_column(:commentable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:commentable_type).of_type(:string) }
  end
end
