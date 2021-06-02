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

  describe '#touch_in' do
    it 'updates the card to be touched' do
      subject.top_up(20)
      subject.touch_in
      expect(subject.journey_status).to eq true
    end
    it 'raises an error if there is not enough money' do
      minimum_balance = Oystercard::MINIMUM_FARE
      expect{ subject.touch_in }.to raise_error 'Not enough in minimum balance'
    end
  end

  describe '#touch_out' do
    it 'updates the card to be touched out' do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject.journey_status).to eq false
    end

    it 'deducts minimum fare when touched out' do
      subject.top_up(20)
      minimum_fare = Oystercard::MINIMUM_FARE - Oystercard::MINIMUM_FARE * 2
      subject.touch_in
      expect {subject.touch_out}.to change{subject.balance}.by(minimum_fare)
    end
  end

  describe '#in_journey' do
    it 'lets us kow if we are touched in' do
      subject.top_up(20)
      subject.touch_in
      expect(subject.in_journey?).to eq 'In use'
    end

    it 'lets us know if we are touched out' do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq 'Not touched on'
    end
  end
end