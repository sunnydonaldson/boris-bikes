require "van"
require "bike"

describe Van do
  let(:broken_bike) { double :broken_bike, :working? => false } 
  let(:docking_station) { double :docking_station, :bikes => [broken_bike]}
  describe "#collect" do 
    it "takes bikes from docking station" do
      van = Van.new
      van.collect(docking_station)
      expect(van.storage.last).to eq(broken_bike)
    end
  end
end