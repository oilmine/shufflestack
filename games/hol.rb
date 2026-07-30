require_relative "../libs/deck"
require_relative "../libs/ui"

def play_hol()
  deck = create_deck
  card = deck.shift
  score = 0

  def logic(guess_var, n_card_var, card_var)
    if guess_var == "h"
      n_card_var[1] > card_var[1]
    elsif guess_var == "l"
      n_card_var[1] < card_var[1]
    else
      false
    end
  end

  until deck.empty? 
    puts "Current card: #{card[0]}"
    puts ""
    print "Is the next card (H)igher or (L)ower? : "
    guess = gets.chomp
    guess = guess.downcase
    n_card = deck.shift
     
    if logic(guess, n_card, card)
      puts "You got it!"
      score = score + 1
      card = n_card
    else
      puts "You didn't get it!"
      puts "The next card was #{card[0]}"
      pause
      break
    end
  end
end