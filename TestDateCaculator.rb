require_relative "DateCalculator"
require "minitest/autorun"

class TestDateCaculator < Minitest::Test
  def is_leapyear(year)
    calc = DateCalculator.new(0)
    calc.year = year
    return calc.leap_year?
  end

  def test_leapyear
    assert is_leapyear(2004)

    assert not(is_leapyear(1900))

    assert is_leapyear(2000)
  end
end
