deck = {
  "🂡" => 14, "🂢" => 2, "🂣" => 3, "🂤" => 4, "🂥" => 5, "🂦" => 6,
  "🂧" => 7, "🂨" => 8, "🂩" => 9, "🂪" => 10, "🂫" => 11, "🂭" => 12, "🂮" => 13,
  "🂱" => 14, "🂲" => 2, "🂳" => 3, "🂴" => 4, "🂵" => 5, "🂶" => 6,
  "🂷" => 7, "🂸" => 8, "🂹" => 9, "🂺" => 10, "🂻" => 11, "🂽" => 12, "🂾" => 13,
  "🃁" => 14, "🃂" => 2, "🃃" => 3, "🃄" => 4, "🃅" => 5, "🃆" => 6,
  "🃇" => 7, "🃈" => 8, "🃉" => 9, "🃊" => 10, "🃋" => 11, "🃍" => 12, "🃎" => 13,
  "🃑" => 14, "🃒" => 2, "🃓" => 3, "🃔" => 4, "🃕" => 5, "🃖" => 6,
  "🃗" => 7, "🃘" => 8, "🃙" => 9, "🃚" => 10, "🃛" => 11, "🃝" => 12, "🃞" => 13
}

deck = deck.to_a.shuffle
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
    break
  end
end