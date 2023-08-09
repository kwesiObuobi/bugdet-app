require 'rails_helper'

describe CategoriesPurchases, type: :model do

  sam = User.new(name: 'Sam', email: 'sam@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
  category = Category.new(author: sam, name: 'Gifts', icon: 'https://icon.png')
  purchase = Purchase.new(author: sam, name: 'Gifts', amount: 100)

  subject do
    CategoriesPurchases.new(category_id: category.id, purchase_id: purchase.id)
  end

  before { subject.save }

  it 'should have a category' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a purchase' do
    subject.purchase_id = nil
    expect(subject).to_not be_valid
  end
end
