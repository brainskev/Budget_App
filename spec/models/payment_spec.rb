require 'rails_helper'

RSpec.describe Payment, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Bese', email: 'Besurye@gmail.com', password: 'HelloRails123')
    before(:each) do
      first_category = Category.create(name: 'Laptops', icon: 'icon.jpg', user_id: first_user.id)
      @payment = Payment.create(name: 'Apple', amount: 200, user_id: first_user.id,
                                category_id: first_category.id)
    end

    it 'Is invalid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end

    it 'Is invalid without amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end

    it 'Amount must be a number' do
      @payment.amount = 'helooooo'
      expect(@payment).to_not be_valid
    end

    it 'Must have author ID' do
      @payment.user_id = nil
      expect(@payment).to_not be_valid
    end
  end
end
