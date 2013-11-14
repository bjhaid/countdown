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
      generate_function(numbers) { |formula| return formula if eval(formula) == @target }
    end
    ''
  end

  def group_in_2s_and_surround_with_parenthesis
    #[["(", 100, 2, ")"], ["(", 7, 4, ")"], ["(", 3, ")"]]
    @chosen_numbers.each_slice(2).map { |nums| nums.unshift "("
       nums.push ")"}
  end

  def generate_function numbers, &block
    possible_no_of_ops = numbers.size - 1
        operations.repeated_permutation(possible_no_of_ops) do |ops|
        elements = numbers.clone
        (1..possible_no_of_ops).each do |counter|
          elements.insert((counter - 1) + counter ,ops[counter -1])
        end
        formula = elements.join(" ")
        yield formula
      end
  end

end
