require_relative 'spec_helper.rb'

describe 'timevalue' do
  it 'should be initialized with 0 as defaults' do
    time_value = TimeValue.new()
    expect(time_value.n).to eq(0)
    
  end
end