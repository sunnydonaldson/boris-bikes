require "docking_station"
require "bike"

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'releases a working bike' do
    docking_station = DockingStation.new
    expect(docking_station.release_bike.class).to eq Bike
    expect(docking_station.release_bike.working?).to eq true
  end

end