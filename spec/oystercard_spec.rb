require 'oystercard.rb'

describe Oystercard do
  it 'it has zero balance when brand new' do
    expect(subject.balance).to eq(0)
  end
  
  describe '#top_up' do
    it 'add money to oystercard' do
      expect(subject.top_up(50)).to eq(50)
    end

    it 'does not exceed top of £90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{subject.top_up(maximum_balance)}.to raise_error 'Exceeded maximum balance'
    end

  end

  describe '#deduct' do
    it 'deducts amount from oystercard' do
      subject.top_up(50)
      expect(subject.deduct(10)).to eq(40)
    end
  end
end