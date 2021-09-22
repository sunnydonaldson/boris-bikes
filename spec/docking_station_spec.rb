require "docking_station"
require "bike"

describe DockingStation do
  bike = Bike.new
  station = DockingStation.new
  station.dock(bike)

  describe '#initialize' do
    it 'allows user to set docking station capacity' do
      expect(DockingStation.new(10).capacity).to eq(10)
    end
  end
  
  describe "#release_bike" do
    
    it { is_expected.to respond_to(:release_bike) }

    it 'releases a working bike' do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      docking_station.dock(Bike.new)
      expect(docking_station.release_bike.class).to eq Bike
      expect(docking_station.release_bike.working?).to eq true
    end

    it 'does not release a broken bike' do
      docking_station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      docking_station.dock(bike)
      expect { docking_station.release_bike }.to raise_error
    end

    it "throws an error if no bikes" do
      station = DockingStation.new
      expect{docking_station.release_bike}.to raise_error
    end
  end

  describe "#dock_bike" do

    it "Allows users to store an instance of bike" do
      #assert
      expect(station.dock(bike)[0].class).to eq(Bike)
    end

    it "Raises an exception when a user attempts to dock a bike when docking station full" do
      (DockingStation::DEFAULT_CAPACITY-1).times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error
    end
  end

  describe "#bikes" do
    it "allows users to see a list of bikes" do
      expect(station.bikes).not_to be_empty
    end

  end

end