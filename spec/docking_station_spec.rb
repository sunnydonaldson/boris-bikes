require "docking_station"
require "bike"

describe DockingStation do
  bike = Bike.new
  station = DockingStation.new
  station.dock(bike)

  describe "#release_bike" do
    
    it { is_expected.to respond_to(:release_bike) }

    it 'releases a working bike' do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      
      expect(docking_station.release_bike.class).to eq Bike
      expect(docking_station.release_bike.working?).to eq true
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
      19.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error
    end
  end

  describe "#bikes" do
    it "allows users to see a list of bikes" do
      expect(station.bikes).not_to be_empty
    end

  end




end