class Station
  attr_reader :zone, :station_name

  def initialize(args = {})
    @zone = args[:zone]
    @station_name = args[:station_name]
  end

end