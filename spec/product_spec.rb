require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before do
      @category = Category.new(name: 'Tools')
      @category.save
    end
    # validation tests/examples here
    it 'creates a new product' do
      @product = @category.products.new(name: 'Whack-Hammer', price: 45, quantity: 8)
      expect(@product).to be_valid
    end

    it 'throws an error if no category is selected' do
      @product = Product.create(name: 'Whack-Hammer', price: 45, quantity: 8)

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'throws an error if no category is selected' do
      @product = Product.create(name: 'Whack-Hammer', quantity: 8)

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'throws an error if no quantity is provided' do
      @product = Product.create(name: 'Whack-Hammer', price: 45)

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

  end
end