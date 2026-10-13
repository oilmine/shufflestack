require_relative "../libs/deck"
require_relative "../libs/ui"
require "colorize"

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

def pl_turn(deck, hand)
  loop do
    show_hand("Your hand: ", hand)
    if hand_value(hand) > 21
      puts "You bust! Dealer wins!".red
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

def pc_turn(deck, hand)
  while hand_value(hand) < 17
    hand << deck.shift
  end
end

def play_blackjack()
  deck = create_deck
  pl_hand = deck.shift(2)
  pc_hand = deck.shift(2)
  pl_alive = pl_turn(deck, pl_hand)
  exit unless pl_alive
  puts "Dealer's turn..\n"
  puts "Dealer reveals: #{pc_hand.map { |card| card[0] }.join(" ")}"
  pc_turn(deck, pc_hand)
  puts ""
  show_hand("Your hand", pl_hand)
  puts ""
  show_hand("Dealer's final hand", pc_hand)
  pl_score = hand_value(pl_hand)
  pc_score = hand_value(pc_hand)
  puts ""

  if pc_score > 21
    puts "Dealer busts! You won!".green
  elsif pl_score > pc_score
    puts "You won!".green
  elsif pc_score > pl_score
    puts "Dealer won!".red
  else
    puts "Push! It's a tie.".blue
  end
  pause
end