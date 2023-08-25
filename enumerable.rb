module MyEnumerable
  def all?
    each { |item| return false unless yield item }
    true
  end

  def any?
    each { |item| return true if yield item }
    false
  end

  def filter
    map { |item| item if yield item }.compact
  end

  def max
    each.reduce { |max, item| max.nil? || item > max ? item : max }
  end

  def min
    each.reduce { |min, item| min.nil? || item < min ? item : min }
  end

 
