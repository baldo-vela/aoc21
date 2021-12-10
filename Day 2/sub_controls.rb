def sub_controls
    puts "Intializing Sub-Control System"
    puts " 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 🔹 \n"
    data = IO.readlines("input.txt")
    postion = [0,0]
    if data == nil
        puts "Error: File not found"
        exit
    elsif 
        puts "File found"
        puts "Loaded #{data.length} lines of data"
        data.each do |line|
            puts "Processing line: #{line}"
            process_command(line, postion)
        end
    end
end

class MoveCommand
    attr_accessor :direction, :distance

    # class array to contain all given commands
    @@move_commands = []

    def initialize(direction, distance)
        @direction = direction
        @distance = distance
    end

    def self.all
        # returns @all array move commands
        return @@move_commands
    end
end

def process_command(line, position)
    #accepts the string of the command and the current position
    #Splits the string into an array of the command and the distance
    #Creates a new MoveCommand object and adds it to the @@move_commands array
end

sub_controls