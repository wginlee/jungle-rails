require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    let(:product) { Product.new(name: 'Priodut', price: 99, quantity: 0, category: 'Apparel')}

    it 'should have a valid test subject' do
      expect(product).to be_valid
    end

    it 'should be invalid without a name' do
      product.name = nil
      expect(product).to_not be_valid
      prodcut.name = ''
      expect(product).to_not be_valid
      product.name = ' '
      expect(product).to_not be_valid

    end

end
