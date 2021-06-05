class Station
  attr_reader :zone, :station_name

  def initialize(arg = {})
    @zone = arg[:zone]
    @station_name = arg[:station_name]
  end

end