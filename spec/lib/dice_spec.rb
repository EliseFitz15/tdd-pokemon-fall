require_relative '../../lib/dice.rb'

RSpec.describe Dice do
  describe ".new" do
    it 'has sides' do
      dice = Dice.new(6)
      expect(dice.sides).to eq(6)
    end
  end

  describe "#roll" do
    context "return a value equel to one of sides of dice" do

      it "return a value 1-6" do
        d6 = Dice.new(6)
        rolls = []
        1_000.times do
          rolls << d6.roll
        end
        expect(rolls.uniq.sort).to eq([1,2,3,4,5,6])
      end
    end
  end
end
