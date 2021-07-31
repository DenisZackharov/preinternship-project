require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { FactoryBot.build(:user) }

    it 'is a firstname' do
      user.firstname = nil
      expect(user).not_to be_valid
    end

    it 'is a lastname' do
      user.lastname = nil
      expect(user).not_to be_valid
    end

    it 'is a email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is a password' do
      user.password = nil
      expect(user).not_to be_valid
    end
  end
end
