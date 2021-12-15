def sub_controls
    puts "Intializing Sub-Control System"
    puts " 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n"
    
    # An array of strings that will be used to store the sub control commands
    data = IO.readlines("input.txt")
    
    # Let Position be [horizontal, vertical]
    postion = [0,0]
    
    if data == nil
        puts "Error: File not found"
    else 
        puts "File found \nLoaded #{data.length} lines of data"
        data.each do |line|
            puts "Processing line: #{line}"
            process_command(line, postion)
        end
        puts "Final Position: \n Horizontal:#{postion[0]}\n Depth:#{postion[1]} \nCross-Product:#{postion[0]*postion[1]}"
    end
end

=begin 
forward X increases the horizontal position by X units.
down X increases the depth by X units.
up X decreases the depth by X units.

Note that since you're on a submarine, down and up affect your depth, and so they have the opposite result of what you might expect.
=end
def process_command(line, position)
    # takes the line and the current position and returns the new position

    # Takes the string line, chomps it and splits it into an array of strings
    # => ["foward", "5"] 
    command = line.chomp.split(" ")
    # check for depth changes
    #Note: Depth is a negative vector, so its a positive magnitude number
    if command[0] == "up" || command[0] == "down"
        if command[0] == "up"
            # "Up" decreases the depth
            position[1] -= command[1].to_i
        else
            position[1] += command[1].to_i
        end
    # check for horizontal changes
    elsif command[0] == "forward" || command[0] == "backward"
        if command[0] == "forward"
            position[0] += command[1].to_i
        else
            position[0] -= command[1].to_i
        end
    end

    
    # returns the updated position
    return position
end


sub_controls