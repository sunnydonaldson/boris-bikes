require "van"
require "bike"

describe Van do
  describe "#collect" do 
    it "takes bikes from docking station" do
      van = Van.new
      docking_station = DockingStation.new
      broken_bike = Bike.new
      broken_bike.report_broken
      docking_station.dock(broken_bike)
      van.collect(docking_station)

      expect(van.storage.last).to eq(broken_bike)
    end
  end
end