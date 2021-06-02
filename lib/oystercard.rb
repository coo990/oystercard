class Oystercard
  attr_reader :balance
  attr_accessor :journey_status

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
    @journey_status = false
  end

  def top_up(amount)
    fail 'Exceeded maximum balance' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in
    fail 'Not enough in minimum balance' if @balance <= MINIMUM_FARE
    @journey_status = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @journey_status = false
  end
  
  def in_journey?
    @journey_status == true ? 'In use' : 'Not touched on'
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end