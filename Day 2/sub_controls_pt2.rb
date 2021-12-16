=begin
 --- Part Two ---

Based on your calculations, the planned course doesn't seem to make any sense. You find the submarine manual and discover that the process is actually slightly more complicated.

In addition to horizontal position and depth, you'll also need to track a third value, aim, which also starts at 0. The commands also mean something entirely different than you first thought:

    down X increases your aim by X units.
    up X decreases your aim by X units.
    forward X does two things:
        It increases your horizontal position by X units.
        It increases your depth by your aim multiplied by X.

Again note that since you're on a submarine, down and up do the opposite of what you might expect: "down" means aiming in the positive direction.

Now, the above example does something different:

    forward 5 adds 5 to your horizontal position, a total of 5. Because your aim is 0, your depth does not change.
    down 5 adds 5 to your aim, resulting in a value of 5.
    forward 8 adds 8 to your horizontal position, a total of 13. Because your aim is 5, your depth increases by 8*5=40.
    up 3 decreases your aim by 3, resulting in a value of 2.
    down 8 adds 8 to your aim, resulting in a value of 10.
    forward 2 adds 2 to your horizontal position, a total of 15. Because your aim is 10, your depth increases by 2*10=20 to a total of 60.

After following these new instructions, you would have a horizontal position of 15 and a depth of 60. (Multiplying these produces 900.)

Using this new interpretation of the commands, calculate the horizontal position and depth you would have after following the planned course. What do you get if you multiply your final horizontal position by your final depth?
   
=end
def sub_controls_pt2
    puts "Intializing Sub-Control System"
    puts " 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n"
    
    # An array of strings that will be used to store the sub control commands
    data = IO.readlines("input.txt")
    
    # Let Position be [horizontal, vertical, aim]
    postion = [0,0,0]
    # aim is a trigonometric bearing relative to the geopositional reference frame
    # [x,z,θ] where [z] is depth, [x] is horizontal, and [θ] is the bearing
    # Assuming [x,y] is a cartesian space coplanar to the surface of the body of water the sub is in.
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
def process_command(string, position)
    # Split the command into an array of strings
    command = string.chomp.split(" ")
    # e.g. [foward, 5]
    # e.g. [up, 1]

    # check for aim changes
    #Note: Depth is a negative vector, so its a positive magnitude number
    # position[2] is aim, a direction relative to the geopositional reference frame
    if command[0] == "up" || command[0] == "down"
        if command[0] == "up"
            # "Up" decreases the aim by the value of the command
            position[2] -= command[1].to_i
        else
            # "Down" increases the aim by the value of the command
            position[2] += command[1].to_i
        end
    # check for horizontal changes
    # [x,z,θ]
    elsif command[0] == "forward" || command[0] == "backward"
        if command[0] == "forward"
            # x = x + Δx
            position[0] += command[1].to_i
        else
            # x = x - Δx
            position[0] -= command[1].to_i
        end
        
        # z = Δx * θ 
        position[1] += command[1].to_i * position[2].to_i
    end

    
    # returns the updated position
    return position
end
sub_controls_pt2