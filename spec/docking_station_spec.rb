require 'bike'
require 'docking_station'

describe DockingStation do

  let(:bike) { Bike.new }
  let(:station) { DockingStation.new(capacity: 20) }

  it 'should accept a bike' do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it 'should release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it 'should know when it is full' do
    expect(station).not_to be_full
    20.times { station.dock(Bike.new) }
    expect(station).to be_full
  end

  it 'should not accept a bike when it is full' do
    station.fill_station(station)
    expect{ station.dock(Bike.new) }.to raise_error(RuntimeError, 'Station is full')
  end

end