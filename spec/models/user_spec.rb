require 'rails_helper'

RSpec.describe(User, type: :model) do
  let(:user) { build(:user) }

  context 'when name field is empty' do
    it 'is invalid' do
      user.name = ''
      expect(user).to_not be_valid
    end
  end

  context 'when name field has number' do
    it 'is invalid' do
      user.name = 'B1b'
      expect(user).to_not be_valid
    end
  end

  context 'when name field is too short' do
    it 'is invalid' do
      user.name = 'Mi'
      expect(user).to_not be_valid
    end
  end

  context 'when name field is too long' do
    it 'is invalid' do
      user.name = 'Mikonikadjkrklfskdjfhdskjfhskjdfhsk'
      expect(user).to_not be_valid
    end
  end

  context 'when surname field is empty' do
    it 'is invalid' do
      user.surname = ''
      expect(user).to_not be_valid
    end
  end

  context 'when surname field has number' do
    it 'is invalid' do
      user.surname = 'B1olli'
      expect(user).to_not be_valid
    end
  end

  context 'when surname field is too short' do
    it 'is invalid' do
      user.surname = 'Ki'
      expect(user).to_not be_valid
    end
  end

  context 'when surname field is too long' do
    it 'is invalid' do
      user.surname = 'TestHowIfSurnameIsToLongItsShouldBeInvalid'
      expect(user).to_not be_valid
    end
  end

  context 'when phone_number is empty' do
    it 'is invalid' do
      user.phone_number = ''
      expect(user).to_not be_valid
    end
  end

  context 'when phone_number has a space' do
    it 'is invalid' do
      user.phone_number = '+2345678312 5'
      expect(user).to_not be_valid
    end
  end

  context 'when phone_number is too long' do
    it 'is invalid' do
      user.phone_number = '+234567831234345'
      expect(user).to_not be_valid
    end
  end

  context 'when phone_number is too short' do
    it 'is invalid' do
      user.phone_number = '+234345'
      expect(user).to_not be_valid
    end
  end

  context 'when phone_number has a letter' do
    it 'sets an error message' do
      user.phone_number = '+23456783123d'
      user.valid?
      expect(user.errors.messages[:phone_number]).to eq ['is not a number']
    end
  end

  context 'when user create many news' do
    it { is_expected.to have_many(:news) }
  end
end
