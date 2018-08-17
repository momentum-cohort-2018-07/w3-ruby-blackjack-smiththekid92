puts "TODO Implement the game of blackjack."

# Hint: for starters, read bin/blackjack.rb

=begin
Rules:
Points start at $100 and you spend $10 per game
1. As long as the hand value is <=21 you can win the game (if value is >21 you lose)
2. 10, Jack, Queen, & King all have an equal value of 10
3. Ace can be either an 1 or an 11. (For this game the Ace can remain 1 or 11 TBD)

Game Flow:
1. Fresh game starts with message
2. As each game ends another $10 is deducted
3. Each new game starts with a new hand
=end

class Card
    attr_accessor :rank
    attr_accessor :suit

    def initialize(rank, suit)
      @rank = rank
      @suit = suit
      @rank_value_hash = {
        :A=>1,
        2=>2, 
        3=>3, 
        4=>4, 
        5=>5, 
        6=>6, 
        7=>7, 
        8=>8,
        9=>9,
        10=>10,
        :J=>10,
        :Q=>10,
        :K=>10
      }
    end

    def rank_value
      @rank_value_hash[@rank]
    end
  
    def greater_than?(other_card)
      rank_value > other_card.rank_value
    end
  
    def == (other_card)
      self.rank == other_card.rank &&
      self.suit == other_card.suit
    end
  
end

class Deck
    def initialize
      @deck = []
      @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
      @suits = [:clubs, :diamonds, :hearts, :spades]
      deck_builder
    end
    
    def deck_builder 
      @suits.each do |suit|
        @ranks.each do |rank|
          card = Card.new(rank, suit)
          @deck << card
        end
      end
    end
  
    def draw
    @deck.shift
    end
  
    def shuffle
    @deck.shuffle!
    end
  
    def cards_left
    @deck.length
    end
  
end


class BlackjackGame
  def initialize
    @new_game = fresh_game_opening
    @hand = []
    @deck_new = Deck.new
  end

  def fresh_game_opening
    puts "Hello and welcome to the game of blackjack! Let's begin.

    You have $100 and bet $10."
  end

  def new_hand
    2.times (@deck_new.draw) 
    new_hand<<card
    #put two cards in players hand
  end

end