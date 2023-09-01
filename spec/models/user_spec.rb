require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Bese', email: 'Besurye@gmail.com', password: 'HelloRails123')

    it 'Should be invalid without a name' do
      first_user.name = nil
      expect(first_user).to_not be_valid
    end

    it 'Should be invalid without without an email' do
      first_user.email = nil
      expect(first_user).to_not be_valid
    end

    it 'Should be invalid without a password' do
      first_user.password = nil
      expect(first_user).to_not be_valid
    end
  end
end
