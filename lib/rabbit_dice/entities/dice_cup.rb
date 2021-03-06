module RabbitDice
  class DiceCup < Entity

    def initialize(attrs={})
      self.refill
    end

    def refill
      @dice = []
      6.times { @dice.push 'green' }
      4.times { @dice.push 'yellow' }
      3.times { @dice.push 'red' }
    end

    # Since we are an object, we want to restrict access to our data
    def dice_count
      @dice.count
    end

    def empty?
      @dice.count == 0
    end

    def roll(previous_roll)
      if previous_roll
        previous_roll.results.each {|die| @dice.push(die.color) if die.type == 'paws' }
      end
      @dice.sort_by! { rand(@dice.count) }
      Roll.new :dice => 3.times.map { @dice.pop }
    end
  end
end
