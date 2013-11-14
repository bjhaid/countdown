class Countdown
  def initialize(target, chosen_numbers)
    @target = target
    @chosen_numbers = chosen_numbers
  end

  def operations
    %w{+ - * /}
  end

  def cheats
    @chosen_numbers.permutation do |numbers|

      possible_no_of_ops = @chosen_numbers.size - 1
      operations.repeated_permutation(possible_no_of_ops) do |ops|
        elements = numbers.clone
        (1..possible_no_of_ops).each do |counter|
          elements.insert((counter - 1) + counter,ops[counter -1])
        end
        formula = elements.join(" ")
        return formula if eval(formula) == @target
      end
    end
    ''
  end

end
