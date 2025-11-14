# frozen_string_literal: true

def draw_card(id, name, hp, power, quote)
  puts "┌──────────────────┐"
  puts "│[#{id}] #{name.ljust(14)}│"
  puts "│------------------│"
  puts "│    ( o_o )       │"
  puts "│    \\_|_/         │"
  puts "│    /   \\         │"
  puts "│ HP:#{hp.to_s.ljust(2)} POW:#{power.to_s.ljust(2)}     │"
  puts "│\"#{quote[0..16].ljust(16)}\"│"
  puts "└──────────────────┘"
end

puts "\n"
draw_card("1", "Safa", 20, 8, "For glory!")

puts "\n"
draw_card("2", "Bart", 15, 7, "Brain the size.")

puts "\n"
