require 'rails_helper'

describe Purchase, type: :model do
  subject do
    sam = User.new(name: 'Sam', email: 'sam@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    Purchase.new(author: sam, name: 'Gifts', amount: 100)
  end

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end
