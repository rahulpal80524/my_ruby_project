require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    product = FactoryBot.build(:product)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product = FactoryBot.build(:product, name: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a description" do
    product = FactoryBot.build(:product, description: nil)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product = FactoryBot.build(:product, price: nil)
    expect(product).to_not be_valid
  end
end