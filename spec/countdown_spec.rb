require 'countdown'

#Input is a list of six numbers, one from [25, 50, 75, 100] and five from (1..10) that the player may choose.  Then a random target number in the range (100..999) is provided by a program.
#The contestant has 30 seconds to provide a series of arithmetic operations (+, -, *, /) on the six smaller numbers that result in the target, or at least as close as possible to the target.
#The example given in the book is:
#List of numbers 100, 5, 5, 2, 6, and 8.
#Target 522.
#Solutions include  (5 * 100) + ((5 + 6) * 2)   and  (100 + 6) * 5 - 8  which both evaluate to 522.

describe Countdown do
  let(:target) { 522 }
  let(:chosen_numbers) { [100, 5, 5, 2, 6,8]}
  it "cheats and returns the solution" do
    game = Countdown.new(target, chosen_numbers)
    solution = game.cheats

    expect(eval(solution)).to eq(target)
    puts  "cheats and returns the solution: #{solution}"
  end

  it "solves a small game" do
    target = 100
    chosen_numbers = [50,2]
    game = Countdown.new(target, chosen_numbers)
    solution = game.cheats
    expect(eval(solution)).to eq(target)
    puts  "solves a small game: #{solution}"
  end

  it "solves a big game" do
    target = 202
    chosen_numbers = [50,4,2]
    game = Countdown.new(target, chosen_numbers)
    solution = game.cheats
    expect(eval(solution)).to eq(target)
    puts  "solves a big game: #{solution}"
  end

  it "solves a complex game" do
    target = 999
    chosen_numbers = [100,2,7,4,3,5]
    game = Countdown.new(target, chosen_numbers)
    solution = game.cheats
    expect(eval(solution)).to eq(target)
    puts  "solves a complex game: #{solution}"
  end
end
