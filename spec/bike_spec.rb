require 'bike'

describe Bike do
  it 'should not be broken after we create it' do
    bike = Bike.new
    expect(bike).not_to be_broken
  end

  it 'should be able to break a bike' do
    bike = Bike.new
    bike.break!
    expect(bike).to be_broken
  end

  it 'should be able to be fixed when broken' do
    bike = Bike.new
    bike.break!
    bike.fix!
    expect(bike).not_to be_broken
  end
end
