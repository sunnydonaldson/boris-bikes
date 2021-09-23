require 'garage'

describe Garage do
  describe '#receive' do
  let(:broken_bike) { double :broken_bike, :working? => false }
    it "stores the bike received" do
      subject.receive(broken_bike)
      expect(subject.bikes[-1]).to eq(broken_bike)
    end

    it "initializes with a default capacity" do
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY
    end

    it "doesn't recieve bikes if full" do
      subject.capacity.times {subject.receive(broken_bike)}
      expect {subject.receive(broken_bike)}.to raise_error "Garage full"
    end

    it "otherwise receives the bike" do
      subject.receive(broken_bike)
      expect(subject.bikes[-1]).to eq broken_bike
    end
  end
end