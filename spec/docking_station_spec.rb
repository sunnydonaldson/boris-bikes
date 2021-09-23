require "docking_station"
require "bike"

describe DockingStation do
  let(:broken_bike) { double :broken_bike, :working? => false}
  let(:bike) { double :bike, :working? => true } 

  station = DockingStation.new
  #station.dock(bike)

  describe '#initialize' do
    it 'allows user to set docking station capacity' do
      expect(DockingStation.new(10).capacity).to eq(10)
    end
  end
  
  describe "#release_bike" do
    docking_station = DockingStation.new
    it { is_expected.to respond_to(:release_bike) }

    it 'releases a working bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike.working?).to eq true
    end

    it 'releases a working bike with broken and working bikes docked' do
      docking_station = DockingStation.new
      docking_station.dock(bike)
      docking_station.dock(broken_bike)
      expect(docking_station.release_bike.working?).to eq true
      expect { docking_station.release_bike }.to raise_error "No working bikes"
    end

    it 'does not release a broken bike' do
      docking_station = DockingStation.new
      docking_station.dock(broken_bike)
      expect { docking_station.release_bike }.to raise_error "No working bikes"
    end

    it "throws an error if no bikes" do
      docking_station = DockingStation.new
      expect{docking_station.release_bike}.to raise_error "No bikes"
    end
  end

  describe "#dock_bike" do
  station = DockingStation.new
    it "Allows users to store an instance of bike" do
      #assert
      expect(station.dock(bike)[0]).to eq(bike)
    end

    it "Raises an exception when a user attempts to dock a bike when docking station full" do
      (DockingStation::DEFAULT_CAPACITY-1).times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error "Docking station full"
    end
  end

  describe "#bikes" do
    it "allows users to see a list of bikes" do
      expect(station.bikes).not_to be_empty
    end

  end
end