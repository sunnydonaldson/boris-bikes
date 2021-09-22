require 'bike'

describe Bike do
  it { should respond_to(:working?) }

  describe '#report_broken' do
    it 'allows user to report a broken bike' do
      bike = Bike.new
      bike.report_broken
      expect(bike.working?).to eq(false)
    end
  end
end