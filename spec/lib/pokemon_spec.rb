require_relative '../../lib/pokemon.rb'

RSpec.describe Pokemon do
  describe ".new" do
    let(:pokemon) {Pokemon.new("Snorlax", "Normal", "Sleeping")}
    it 'has a name' do
      expect(pokemon.name).to eq("Snorlax")
    end
    it 'has a type' do
      expect(pokemon.type).to eq("Normal")
    end
    it 'has a ability' do
      expect(pokemon.ability).to eq("Sleeping")
    end
    it 'has hit point' do
      expect(pokemon.hit_points).to eq(50)
    end
    it 'has a strength' do
      expect(pokemon.strength).to be > 0
    end
  end

  describe "#train" do
    context "pokemon's strength increases" do
      let(:pikachu) { Pokemon.new("Pikachu", "Electric", "Lightning") }
      it 'has increased strength value' do
        original_strength = pikachu.strength
        pikachu.train
        expect(pikachu.strength).to be > original_strength
      end
    end
  end

  describe "#attack!(pokemon)" do
    context "pokemon one lowers the hit_points for pokemon two" do
      let(:onyx) { Pokemon.new("Onyx", "Earth", "Rock Smash", 50) }
      let(:psyduck) { Pokemon.new("Psyduck", "Water", "Confusion", 25) }

      it 'lowers hit points for p2' do
        attack_strength = psyduck.strength / 2
        expect(psyduck.attack!(onyx)).to eq(onyx.hit_points - attack_strength)
      end
    end
  end

  describe '#alive?' do
    context 'pokemon alive based on hit points' do
      let(:live_one) { Pokemon.new("Pikachu", "Electric", "Lightning", 20) }
      let(:dead_one) { Pokemon.new("Pikachu", "Electric", "Lightning", 0) }

      it 'has hit_points > 0' do
        expect(live_one.alive?).to eq(true)
      end

      it 'has hit_points <= 0' do
        expect(dead_one.alive?).to eq(false)
      end
    end
  end
end
