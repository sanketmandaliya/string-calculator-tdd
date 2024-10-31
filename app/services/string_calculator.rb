class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = parse_delimiter(numbers)
    nums = convert_to_numbers(numbers, delimiter)
    check_for_negatives(nums)

    nums.sum
  end

  private

  def self.parse_delimiter(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2..].split("\n", 2).first
      numbers = numbers.split("\n", 2).last
      [delimiter, numbers]
    else
      [/,|\n/, numbers]
    end
  end

  def self.convert_to_numbers(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i)
  end

  def self.check_for_negatives(nums)
    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(", ")}" if negatives.any?
  end
end
