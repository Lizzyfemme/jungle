require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save a valid product' do
      @category = Category.create(name:"Apparel")
      product = Product.new(
        name: "Canadian Spy Belt",
        price: 55.00,
        quantity: 10,
        category_id: @category.id
        )
      expect(product).to (be_valid)
    end

    it 'should not save without a valid name' do
      @category = Category.create(name: "Apparel")
      name = Product.new(
        name: nil,
        price: 55.00,
        quantity: 10,
        category_id: @category.id
        )
      expect(name).to_not (be_valid)
    end

    it 'should not save without a valid price' do
      @category = Category.create(name: "Apparel")
      price = Product.new(
        name: "Cat Socks",
        price: nil,
        quantity: 10,
        category_id: @category.id
        )
      expect(price).to_not (be_valid)
    end

    it 'should not save without a valid quantity' do
      @category = Category.create(name: "Food")
      quantity = Product.new(
        name: "Kangaroo Burgers",
        price: 10.00,
        quantity: nil,
        category_id: @category.id
        )
      expect(quantity).to_not (be_valid)
    end

    it 'should not save without a valid category id' do
      @category = Category.create(name: "Food")
      category_id = Product.new(
        name: nil,
        price: 10.00,
        quantity: 19,
        category_id: nil
        )
      expect(category_id).to_not (be_valid)
    end
  end
end