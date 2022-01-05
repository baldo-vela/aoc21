=begin
https://adventofcode.com/2021/day/3

--- Day 3: Binary Diagnostic ---

The submarine has been making some odd creaking noises, so you ask it to produce a diagnostic report just in case.

The diagnostic report (your puzzle input) consists of a list of binary numbers which, when decoded properly, can tell you many useful things about the conditions of the submarine. The first parameter to check is the power consumption.

You need to use the binary numbers in the diagnostic report to generate two new binary numbers (called the gamma rate 'γ' and the epsilon rate 'ε'). The power consumption can then be found by multiplying the gamma rate by the epsilon rate.

Each bit in the gamma rate can be determined by finding the most common bit in the corresponding position of all numbers in the diagnostic report. For example, given the following diagnostic report:

00100
11110
10110

10111
10101
01111

00111
11100
10000

11001
00010
01010

Considering only the first bit of each number, there are five 0 bits and seven 1 bits. Since the most common bit is 1, the first bit of the gamma rate is 1.

The most common second bit of the numbers in the diagnostic report is 0, so the second bit of the gamma rate is 0.

The most common value of the third, fourth, and fifth bits are 1, 1, and 0, respectively, and so the final three bits of the gamma rate are 110.

So, the gamma rate is the binary number 10110, or 22 in decimal.

The epsilon rate is calculated in a similar way; rather than use the most common bit, the least common bit from each position is used. So, the epsilon rate is 01001, or 9 in decimal. Multiplying the gamma rate (22) by the epsilon rate (9) produces the power consumption, 198.

Use the binary numbers in your diagnostic report to calculate the gamma rate and epsilon rate, then multiply them together. What is the power consumption of the submarine? (Be sure to represent your answer in decimal, not binary.)

=end
# Part 1
# To-Do:
# Load the input file
# Load the input into an array
# Build a matrix, each row is a binary number string dynamically sized from the input file
require 'matrix'

def solution
    # Control Function that calls the other functions
    puts "Initializing Day 3: Binary Diagnostic"

    # Load the input file
    data = IO.readlines("input.txt")
    test_data = Matrix.build()

    # check if the file was loaded
    if data == nil
        puts "Error: File not found"
    else
        puts "File found \nLoaded #{data.length} lines of data"
        # Build a matrix, each row is a line from the input file
        process_data(data)
        
end

def process_data(data)
    # Build a matrix, each row is a binary number string dynamically sized from the input file
    matrix = Matrix.new(data.length) { Array.new(data[0].length) }
    # Fill the matrix with the binary number strings
    #TODO Test this
    data.each_with_index do |line, index|
        line.chomp.split("").each_with_index do |char, index|
            matrix[index][index] = char
        end
    end

    # Calculate the gamma rate and epsilon rate
    gamma_rate = calculate_gamma_rate(matrix)
    epsilon_rate = calculate_epsilon_rate(matrix)
    # Calculate the power consumption
    power_consumption = gamma_rate * epsilon_rate
    puts "Power Consumption: #{power_consumption}"
    return (power_consumption, gamma_rate, epsilon_rate)
end


def calculate_gamma_rate(matrix)
    # uses the given matrix to calculate the `gamma rate` given the problem description
end

def calculate_epsilon_rate(matrix)
    # uses the given matrix to calculate the `epsilon rate` given the problem description
end