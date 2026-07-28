require_relative "games/hol"
require_relative "games/war"
require_relative "games/hc"
require_relative "libs/ui"

title
begin
  loop do
    gm_lvl = ["war", "hol", "hc"]
    clear
    title
    puts "______________________________"
    print "|   War   |   "
    print "HoL   |   "
    print "HC   |   "
    puts ""
    puts ""
    print "CHOOSE THE GAMEMODE: "
    gm = gets.chomp.downcase
    puts ""
    if !gm_lvl.include?(gm)
      puts "Invalid gamemode."
      exit
    end
    
    if gm == gm_lvl[0]
      play_war()
    elsif gm == gm_lvl[1]
      play_hol()
    elsif gm == gm_lvl[2]
      play_hc()
    end
end
rescue Interrupt
  puts ""
  puts "Quitting!"
  clear
  exit
end