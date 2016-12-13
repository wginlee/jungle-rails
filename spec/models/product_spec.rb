require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    cat = Category.new(name: 'Oppai')
    let(:product) { Product.new(name: 'Priodut', price_cents: 99, quantity: 0, category: cat)}

    it 'should have a valid test subject' do
      expect(product).to be_valid
    end

    it 'should be invalid without a name' do
      product.name = nil
      expect(product).to_not be_valid
      product.name = ''
      expect(product).to_not be_valid
      product.name = ' '
      expect(product).to_not be_valid

    end

    it 'should be invalid without a price' do
      product.price_cents = nil
      expect(product).to_not be_valid

    end

    it 'should be invalid without a quantity' do
      product.quantity = nil
      expect(product).to_not be_valid

    end

    it 'should be invalid without a category' do
      product.category = nil
      expect(product).to_not be_valid

    end


  end


end
