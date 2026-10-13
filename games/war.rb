require_relative "../libs/deck"
require_relative "../libs/ui"

def play_war()
  deck = create_deck
  pl_deck = deck.shift(26)
  pc_deck = deck
  wars = 0
  rounds = 0

  until pl_deck.empty? || pc_deck.empty?
    rounds = rounds + 1
    pl_card = pl_deck.shift
    pc_card = pc_deck.shift
    puts "\nRound #{rounds}"
    puts "You: #{pl_card[0]}"
    puts "PC: #{pc_card[0]}"
    sleep(0.1)

    if pl_card[1] > pc_card[1]
      puts "You won!"
      pl_deck << pl_card << pc_card
    elsif pl_card[1] < pc_card[1]
      puts "PC won!"
      pc_deck << pl_card << pc_card
    else
      puts "WAR!"
      wars += 1
      war_cards = [pl_card, pc_card]
      3.times do
        break if pl_deck.empty? || pc_deck.empty?
        war_cards << pl_deck.shift
        war_cards << pc_deck.shift
        print "🂠 "
        sleep(0.3)
      end
      puts ""
      pl_war_card = pl_deck.shift
      pc_war_card = pc_deck.shift

      if pl_war_card.nil? || pc_war_card.nil?
        break
      end
      war_cards << pl_war_card
      war_cards << pc_war_card
      puts "You: #{pl_war_card[0]}"
      puts "PC: #{pc_war_card[0]}"

      if pl_war_card[1] > pc_war_card[1]
        puts "You won the war!"
        pl_deck.concat(war_cards)
      elsif pl_war_card[1] < pc_war_card[1]
        puts "PC won the war!"
        pc_deck.concat(war_cards)
      else
        puts "Another war!"
      end
    end
    puts "\nYour cards: #{pl_deck.length}"
    puts "PC's cards: #{pc_deck.length}"
  end
  puts "Game over!"
  puts "Rounds played: #{rounds}"
  puts "Wars: #{wars}"
  
  if pl_deck.empty?
    puts "PC wins the game!".red
  else
    puts "You win the game!".green
  end
  pause
end