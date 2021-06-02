class Oystercard
  attr_reader :balance, :entry_station


  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
    @entry_station = nil
  end

  def top_up(amount)
    fail 'Exceeded maximum balance' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail 'Not enough in minimum balance' if @balance <= MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end
  
  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end