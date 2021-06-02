require 'oystercard.rb'

describe Oystercard do
  it 'it has zero balance when brand new' do
    expect(subject.balance).to eq(0)
  end
  
  describe '#top_up' do
    it 'add money to oystercard' do
      expect(subject.top_up(50)).to eq(50)
    end
  end
end