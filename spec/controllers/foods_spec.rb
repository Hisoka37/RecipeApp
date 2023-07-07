require 'rails_helper'

RSpec.describe Food, type: :request do
  subject do
    @user = User.create(name: 'test', email: 'test@mail.com', password: 'password')
    Food.create(name: 'Rice', measurement: '5', price: 200, quantity: '2', user: @user)
  end

  before(:each) { subject.save }

  it 'should have a name' do
    expect(subject.name).to eql('Rice')
  end

  it 'should have a description' do
    expect(subject.measurement).to eql('5')
  end

  it 'Should always have preparation time' do
    expect(subject.price).to eql(200)
  end

  it 'Should always have cooking time' do
    expect(subject.quantity).to eql('2')
  end
end
