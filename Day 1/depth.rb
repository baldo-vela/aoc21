def depth
    puts "Running Depth Finder"

    # Loads the puzzle input file line by line to populate an array
    data = IO.readlines("input.txt")

    # Placeholder for the number of times a depth measurement increases from the previous measurement. 
    count = 0
    temp = 0

    data.each_with_index do |value, index| 
        # If the current depth is greater than the previous depth, increase the count by 1
        
        if temp == 0 
            # The first value is always 0
            puts "#{index+1} => #{value} (N/A - no previous measurement)"
        elsif value > temp 
            # If the current depth is greater than the previous depth, increase the count by 1, and print the current depth with increased
            count += 1 
            puts "#{index+1} => #{value} (increased)"
        elsif value < temp  
            # If the current depth is less than the previous depth, do nothing but print the depth with decreased
            puts "#{index+1} => #{value} (decreased)"
        end
        
        #Updates the previous depth to the current depth
        temp = value
    end
    puts "Total number of times the depth increased: #{count}"
end

depth