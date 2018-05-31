# Neil Patel & Surim Kim
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+

require 'Minitest/autorun'
require_relative 'args_checker'

# UNIT TESTS FOR METHOD args_checker(arr)
# Equivalence Classes:
# If 0 arguments => @return true
# If > 0 arguments => @return false

# Immplementation of Args Checker Test
class ArgsCheckerTest < Minitest::Test
  def test_args_checker_zero								# Checks if the argument count passed in is zero
    args_checker = ArgsChecker.new
    arr = []
    assert_equal true, args_checker.check_mode(arr)			# Assert equal true if the array of values passed is in fact 0
  end

  def test_args_checker_one									# Checks if the artgument count passed in is one
    args_checker = ArgsChecker.new
    arr = [1]
    assert_equal false, args_checker.check_mode(arr)		# Assert equal false if the array of values passed is in fact 1
  end
end
