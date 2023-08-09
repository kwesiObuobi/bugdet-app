require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Sam', email: 'sam@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh') }

  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end