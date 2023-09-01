require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Bese', email: 'Besurye@gmail.com', password: 'HelloRails123') }

  before(:each) do
    @category = Category.new(name: 'Laptop', icon: 'icon.jpg', user:)
  end

  context 'Validation tests' do
    it 'Is invalid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'Is invalid without an icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end

    it 'Must have a user' do
      @category.user = nil
      expect(@category).to_not be_valid
    end
  end
end
