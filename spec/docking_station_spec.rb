require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'release working bike' do
  	subject.dock double :bike, working?: true
    bike = subject.release_bike
  	expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do 
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end 

    it 'raises an error when releasing broken bike' do
      bike = double :bike, working?: false
      subject.dock bike
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'releases a working bike' do
      bike = double :bike, working?: false; bike2 = double :bike2, working?: true
      subject.dock bike; subject.dock bike2
      expect(subject.release_bike).to eq bike2 
    end
  end

  describe 'dock' do
    it 'raises an error when full' do
      bike = double :bike, working?: true
      subject.capacity.times { subject.dock :bike }
      expect { subject.dock :bike }.to raise_error 'Docking station full'
    end
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it { is_expected.to respond_to :capacity= }
  end



end

 
