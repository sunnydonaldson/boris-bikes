require 'garage'

describe Garage do
  describe '#receive' do
    let(:broken_bike) { double :broken_bike, :working? => false } 
    it "stores the bike received" do
      subject.receive(broken_bike)
      expect(subject.storage[0]).to eq(broken_bike)
    end
  end
end