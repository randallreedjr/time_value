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
end