=begin 
````Begin Quote From````````https://adventofcode.com/2021/day/1#part2

Considering every single measurement isn't as useful as you expected: there's just too much noise in the data.

Instead, consider sums of a three-measurement sliding window. Again considering the above example:

199  A      
200  A B    
208  A B C  
210    B C D
200  E   C D
207  E F   D
240  E F G  
269    F G H
260      G H
263        H

Start by comparing the first and second three-measurement windows. The measurements in the first window are marked A (199, 200, 208); their sum is 199 + 200 + 208 = 607. The second window is marked B (200, 208, 210); its sum is 618. The sum of measurements in the second window is larger than the sum of the first, so this first comparison increased.

Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum. So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough measurements left to create a new three-measurement sum.

In the above example, the sum of each three-measurement window is as follows:

A: 607 (N/A - no previous sum)
B: 618 (increased)
C: 618 (no change)
D: 617 (decreased)
E: 647 (increased)
F: 716 (increased)
G: 769 (increased)
H: 792 (increased)

In this example, there are 5 sums that are larger than the previous sum.

Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?
`````End Quote````
Additional Reading: https://youtu.be/MK-NZ4hN7rs

=end

def depth_pt2 
    puts "Running Depth Analysis 2.0"
        # Loads the puzzle input file line by line to populate an array
        data = IO.readlines("input.txt")
        test_data=IO.readlines("test_input.txt")
        puts "Attempting to Analyze puzzle imput file:"
        window_analysis(data, 3)
        puts "Attempting to Analyze Test Data for comparison:"
        window_analysis(test_data, 3)
end

def window_analysis(array, window_size = 3)
    # Accepts an array of integers and an optional window size
    previous_sum = 0

    # Register for the number of times the sum of the window is larger than the previous sum
    counter = 0
    
    i = 0
    while i <= (array.length-window_size) do
        # When the loop has reached the window size, it takes the sum of all values in the window and compares it to the previous sum
        # Initialize the window, calling #slice with the index, and the length of the window
        #window = array.slice(i, window_size)

        # The sum of the window
        window_sum = (array[i].to_i + array[i+1].to_i + array[i+2].to_i).to_i
        if (previous_sum !=0) && previous_sum < window_sum
            # If the new sum is larger than the previous sum, increase the counter
            counter += 1
        end
        previous_sum = window_sum
        if array.length > 0 && ( i <= 20 || i > array.length-10) 
            puts "#{i} #{window_sum}"
        end
        #Increment the loop counter
        i += 1
    end
    puts "Analysis ran #{i} time(s)."
    puts "Tabulated #{counter} sums larger than previous."

end
# def better_window_analysis(array, window_size = 3)
#     # Accepts an array of integers and an optional window size
#     previous_sum = 0

#     # Register for the number of times the sum of the window is larger than the previous sum
#     counter = 0
    
#     array.each_slice(window_size) do |window|
#     puts "Analysis ran #{i} time(s)."
#     puts "Tabulated #{counter} sums larger than previous."

# end
depth_pt2