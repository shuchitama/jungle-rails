require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves successfully with all fields set" do
      @category = Category.create(name: "Category name")
      @product = Product.create(name: "Shoes", price: 2345, quantity: 19, category: @category)
      expect(@product.errors.full_messages).to be_empty
    end
    it "is not valid without a name" do
      @category = Category.new
      @product = Product.new(price: 2345, quantity: 19, category: @category.id)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "is not valid without a price" do
      @category = Category.new
      @product = Product.new(name: "Shoes", quantity: 19, category: @category.id)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.new(name: "Shoes", price: 2345, category: @category.id)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "is not valid without a category" do
      @product = Product.new(name: "Shoes", price: 2345, quantity: 19)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
    end
  end
end
