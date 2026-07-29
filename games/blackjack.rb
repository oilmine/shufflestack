require_relative "../libs/deck"
require_relative "../libs/ui"

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
    puts ""
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

def play_blackjack()
  deck = create_deck
  pl_hand = deck.shift(2)
  pc_hand = deck.shift(2)
  player_alive = player_turn(deck, pl_hand)
  exit unless player_alive

  puts "\nDealer's turn.."
  puts "Dealer reveals: #{pc_hand.map { |card| card[0] }.join(" ")}"
  dealer_turn(deck, pc_hand)

  show_hand("\nYour hand: ", pl_hand)
  show_hand("Dealer's final hand: ", pc_hand)

  player_score = hand_value(pl_hand)
  dealer_score = hand_value(pc_hand)

  puts ""

  if dealer_score > 21
    puts "Dealer busts! You won!"
  elsif player_score > dealer_score
    puts "You won!"
  elsif dealer_score > player_score
    puts "Dealer won!"
  else
    puts "Push! It's a tie."
  end
  pause
end