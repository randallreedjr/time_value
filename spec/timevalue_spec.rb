require_relative '../config/environment.rb'

describe 'timevalue' do
  it 'should be initialized with 0 as defaults' do
    time_value = TimeValue.new()
    expect(time_value.n).to eq(0)
    expect(time_value.i).to eq(0)
    expect(time_value.pv).to eq(0)
    expect(time_value.pmt).to eq(0)
    expect(time_value.fv).to eq(0)
  end

  let(:time_value) { TimeValue.new() }
  it 'should calculate number of periods correctly' do
    time_value.i = 8
    time_value.pv = 0
    time_value.pmt = -100
    time_value.fv = 5000
    expect(time_value.calcN).to eq(21)
  end
end