class Oystercard
  attr_reader :balance, :journey 
  attr_accessor :entry_station, :exit_station, :journey


  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  STARTING_BALANCE = 0


  def initialize
    @balance = STARTING_BALANCE
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
    @journey = []
  end

  def top_up(amount)
    fail 'Exceeded maximum balance' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail 'Not enough in minimum balance' if @balance <= MINIMUM_FARE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @in_journey = false
    @exit_station = exit_station
    journeys
  end
  
  def in_journey?
    !!@in_journey
  end

  def journeys
    @journey << {entry_station: entry_station, exit_station: exit_station}
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end