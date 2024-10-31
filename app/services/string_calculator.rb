class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = numbers.start_with?("//") ? numbers[2..].split("\n", 2).first : /,|\n/
    numbers = numbers.split("\n", 2).last if numbers.start_with?("//")
    nums = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(", ")}" if negatives.any?

    nums.sum
  end
end