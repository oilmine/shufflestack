require "colorize"

def clear
  system("clear") || system("cls")
end

def title
  clear
  puts ""
  puts "═".light_blue * 40
  puts "             SHUFFLESTACK            "
  puts "═".light_blue * 40
end

def pause
  puts
  print "Press Enter to continue..."
  gets
end
