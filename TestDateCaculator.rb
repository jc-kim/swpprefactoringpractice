require_relative "DateCalculator"
require "minitest/autorun"

class TestDateCaculator < Minitest::Test
  def is_leapyear(year)
    calc = DateCalculator.new(0)
    calc.year = year
    return calc.leap_year?
  end

  def add_leap_year(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    calc.add_leap_year
    return calc.year
  end

  def add_regular_year(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    calc.add_regular_year
    return calc.year
  end

  def test_leapyear
    assert is_leapyear(2004)

    assert not(is_leapyear(1900))

    assert is_leapyear(2000)
  end

  def test_add_leap_year
    assert_equal 2008, add_leap_year(255, 2008)
    assert_equal 2009, add_leap_year(400, 2008)
    assert_equal 2009, add_leap_year(366, 2008)
  end

  def test_add_regular_year
    assert_equal 2009, add_regular_year(255, 2009)
    assert_equal 2010, add_regular_year(400, 2009)
    assert_equal 2010, add_regular_year(365, 2009)
  end

  def convert(days, year)
    calc = DateCalculator.new(days)
    calc.year = year
    return calc.convert
  end

  def test_convert
    assert_equal 2009, convert(364, 2009)
    assert_equal 2008, convert(365, 2008)
    assert_equal 2010, convert(365, 2009)
    assert_equal 2009, convert(366, 2008)
    assert_equal 2010, convert(366, 2009)
    assert_equal 2009, convert(367, 2008)
  end
end
