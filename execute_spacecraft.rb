require './spacecraft.rb'

craft = Spacecraft.new(0, 0, 0, 'N')

commands = ["f", "r", "u", "b", "l"]

craft.execute_commands(commands)

puts "Final Position: #{craft.position}"

puts "Final Direction: #{craft.direction}"