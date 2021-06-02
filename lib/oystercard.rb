class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
  end

  def top_up(amount)
    fail 'Exceeded maximum balance' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

end