module MyEnumerable
  def all?(&block)
    each { |item| return false unless block.call(item) }
    true
  end

  def any?(&block)
    each { |item| return true if block.call(item) }
    false
  end

  def filter(&block)
    result = []
    each { |item| result << item if block.call(item) }
    result
  end

  def max
    max = nil
    each { |item| max = item if max.nil? || item > max }
    max
  end

  def min
    min = nil
    each { |item| min = item if min.nil? || item < min }
    min
  end

  def sort(&block)
    sorted = to_a
    if block_given?
      sorted.sort(&block)
    else
      sorted.sort
    end
  end
end
