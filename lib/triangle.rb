class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle
    if (a == b && b == c)
      :equilateral
    elsif (a == b || b == c || a == c)
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    a > 0 && b > 0 && c > 0
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def valid_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
