require_relative "../libs/deck"
require_relative "../libs/ui"

def play_blackjack()
  def hand_value(hand)
    value = hand.map { |card| card[1] }.sum
    aces = hand.count { |card| card[1] == 14 }
    while value > 21 && aces > 0
      value = value - 10
      aces = aces - 1
    end
    value
  end

  def show_hand(name, hand)
    puts "#{name}: #{hand.map { |card| card[0] }.join(" ")}"
    puts "Value: #{hand_value(hand)}"
  end

  def player_turn(deck, hand)
    loop do
      show_hand("Your hand: ", hand)
      if hand_value(hand) > 21
        puts "Bust!"
        return false
      end
      print "(H)it or (S)tand: "
      choice = gets.chomp.downcase
      if choice == "h" || choice == "hit"
        hand << deck.shift
      elsif choice == "s" || choice == "stand"
        return true
      else
        puts "Invalid choice."
      end
    end
  end

  def dealer_turn(deck, hand)
    while hand_value(hand) < 17
      hand << deck.shift
    end
  end

  deck = create_deck
  pl_deck = deck.shift(2)
  pc_deck = deck.shift(2)
  player_alive = player_turn(deck, pl_deck)
  exit unless player_alive

  puts "\nDealer's turn.."
  dealer_turn(deck, pc_deck)

  show_hand("\nYour hand: ", pl_deck)
  show_hand("\nDealer's hand: ", pc_deck)

  player_score = hand_value(pl_deck)
  dealer_score = hand_value(pc_deck)

  puts ""

  if dealer_score > 21
    puts "Dealer busts! You win!"
  elsif player_score > dealer_score
    puts "You win!"
  elsif dealer_score > player_score
    puts "You bust! Dealer wins!"
  else
    puts "Push! It's a tie."
  end
  pause
end