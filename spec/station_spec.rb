require 'station'

describe Station do

  subject {described_class.new(station_name: "Arsenal", zone: 2)}

  it 'checks the zone of the station' do
    expect(subject.zone).to eq(2)
  end

  it 'finds name of station' do
    expect(subject.station_name).to eq("Arsenal")
  end
end