module RabbitDice
  class Turn < Entity
    attr_accessor :game_id, :rolls, :player

    def initialize(attrs={})
      @rolls = []
      super(attrs)
    end

    def score
      # A score is the number of meat rolled, UNLESS there are three wounds
      if over?
        0
      else
        @rolls.sum_attr(:score)
      end
    end

    def wound_count
      @rolls.sum_attr(:wounds)
    end

    def over?
      wound_count >= 3
    end
  end
end
