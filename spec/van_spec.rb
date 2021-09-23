require "van"
require "bike"

describe Van do
  let(:broken_bike) { double :broken_bike, :working? => false } 
  let(:docking_station) { double :docking_station, :bikes => [broken_bike], :full? => false}
  let(:full_docking_station) { double :full_docking_station, :full? => true}
  let(:garage) { double :garage, :full? => false, :bikes => []}

  describe "#collect" do 
    it "takes bikes from docking station" do
      van = Van.new
      van.collect(docking_station)
      expect(van.bikes.last).to eq(broken_bike)
    end
  end

  describe "#deliver" do
    it {is_expected.to respond_to(:deliver).with(1).argument}

    it "doesn't deliver bikes if location full" do
      expect {subject.deliver(full_docking_station)}.to raise_error "Location full"
    end

    it "otherwise it drops off bike" do
      subject.collect(docking_station)
      subject.deliver(garage)
      expect(subject.bikes).to be_empty
    end
  end
end