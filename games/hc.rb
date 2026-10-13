require_relative "../libs/deck"
require_relative "../libs/ui"

def play_hc()
  deck = create_deck
  pl_score = 0
  pc_score = 0

  until deck.empty?
    pl_card = deck.shift
    pc_card = deck.shift
    puts "\nYour card: " + pl_card[0]
    puts "PC's card: " + pc_card[0]
    puts ""
    
    if (pl_card[1] > pc_card[1])
      pl_score = pl_score + 1
      puts "You won the round!\n"
    else
      pc_score = pc_score + 1
      puts "Computer won the round!\n"
    end
    puts ""
  end
  puts "\n\nYour score: #{pl_score}"
  puts "PC's score: #{pc_score}\n"

  if pl_score > pc_score
    print "You won the match!"
  else
    print "PC won the match!"
  end
  pause
end