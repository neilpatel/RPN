# Neil Patel & Surim Kim
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+

require 'Minitest/autorun'
require_relative 'variables'

# Implementation of Variables Testing
class VariablesTest < Minitest::Test
  def test_start								# Checks if the variables method start and sees if its empty
    variables = Variables.new					# Create an instance of the variables class
    assert_empty variables.start				# Assert equal > Call the start method and make sure the beginning is empty
  end
	
  def test_set_val								# Check whether the set of operations work, should set to 5 and variable should equal 5. 
    variables = Variables.new
    assert_equal 5, variables.set_var(0,5)		# Assert equal >> Pass in in (0,5) and test for output of 5. 
  end
end
