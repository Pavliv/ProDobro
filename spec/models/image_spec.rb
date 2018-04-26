require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:image) }

    # it { is_expected.to validate_attachment_content_type(:image)
    #           allowing('image/png', 'image/gif', 'image/jpeg', 'image/jpg')
    #           rejecting('text/plain', 'text/xml') }

    # it { is_expected.to file_size(:image) less_than: 1.megabytes }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:imageable) }
  end
end
