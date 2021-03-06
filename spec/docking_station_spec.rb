require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

  end

  it 'releases working bikes' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to  include(bike)
  end

  describe '#dock' do
    it 'raises an error when full' do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect {subject.dock(bike)}.to raise_error 'Docking station is full'
    end
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end

end
