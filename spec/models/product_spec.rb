require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do 
    @category = Category.new(id: 10, name: "test")
    @category.save
    @product = Product.new(name: "lol", description: "yo", price_cents: 100, quantity: 10, category_id: @category.id)
    # subject {
    #   described_class.new(name: "lol", description: "yo", price_cents: 100, quantity: 10, category_id: @category.id)
    # }
  end
  
  describe 'Validations' do

    it "has a name" do
      expect(@product.name).not_to eql(nil)
    end

    it "has a price" do
      expect(@product.price).not_to eql(nil)
    end

    it "has a quantity" do
      expect(@product.quantity).not_to eql(0)
    end

    it "has a category" do
      expect(@product.category).not_to eql(nil)
    end

  end
end
