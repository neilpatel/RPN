# Neil Patel
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+

require 'Minitest/autorun'
require_relative 'token_parser'

# Implementation of Token Parser Testing
class TokenParserTest < Minitest::Test
  def test_input_to_arr															#tests the input to arr method by checking if it correctly parses the array
    token_parser = TokenParser.new
    str = 'h e l l o'
    arr = ['h','e','l','l','o']
    assert_equal arr, token_parser.input_to_arr(str)
  end
  
  def test_number?																# Checks the conditional of passing in a number will produce the respective value. 
    token_parser = TokenParser.new
    str = '8'
    assert_equal str.to_s.match(/\A[-+]?\d+\z/), token_parser.number?(str)
  end

  def test_number_error														 	# Checks to see if numbers behave correctly with edge cases
    token_parser = TokenParser.new
    str = 'taco'
    assert_nil token_parser.number?(str)
  end

  def test_variable?															# Checks to see if the variable method call behvaes correctly
    token_parser = TokenParser.new
    str = 'u'
    assert_equal 0, token_parser.variable?(str)
  end
  
  def test_variable_error?														# Checks a CORNER CASE for the Variable Method Call
    token_parser = TokenParser.new
    str = '8'
    assert_nil token_parser.variable?(str)
  end
  
  def test_operator_plus														# Check the method call for the plus operator
    token_parser = TokenParser.new
    str = '+'
    assert token_parser.operator?(str)
  end
  
  def test_operator_minus														# Check the method call for the minus operator
    token_parser = TokenParser.new
    str = '-'
    assert token_parser.operator?(str)
  end
  
  def test_operator_times														# Check the method call for the multiply operator
    token_parser = TokenParser.new
    str = '*'
    assert token_parser.operator?(str)
  end
  
  def test_operator_divide														# Check the method call for the divider operator
    token_parser = TokenParser.new
    str = '/'
    assert token_parser.operator?(str)
  end
  
  def test_operator_error														# Check for CORNER CASE for the operator method call
    token_parser = TokenParser.new
    str = 'taco'
    refute token_parser.operator?(str)
  end
  
  def test_keyword_let															# Checks to see if the keywords work as designed
    token_parser = TokenParser.new
    str = 'LET'
    assert token_parser.keyword?(str)
  end

  def test_keyword_print														# Checks the keyword PRINT
    token_parser = TokenParser.new
    str = 'PRINT'
    assert token_parser.keyword?(str)
  end
																				# Checks to see if the user enters the keyword to quit the program
  def test_keyword_quit
    token_parser = TokenParser.new
    str = 'QUIT'
    assert token_parser.keyword?(str)
  end
  
  def test_keyword_error														# Checks a CORNER CASE for the keyword method call
    token_parser = TokenParser.new
    str = 'TACO'
    refute token_parser.keyword?(str)
  end
  
  def test_unknown_keyword														# Checks the unknown_keyword method call
    token_parser = TokenParser.new
    str = 'Cheese'
    assert token_parser.unknown_keyword?(str)
  end
  
  def test_unknown_keyword_known?												# Checks an edge case of the unknown_keyword method call
    token_parser = TokenParser.new
    str = 'LET'
    assert 0, token_parser.unknown_keyword?(str)
  end

  def test_parse_arr_num														# Checks the parsing of the array with a particular number
    token_parser = TokenParser.new
    arr = ['8']
    def check_type; '1'; end
    assert '1', token_parser.parse_arr(arr)
  end
  
  def test_parse_arr_variable													# Checks the parsing of the array method with a particular variable
    token_parser = TokenParser.new
    arr = ['a']
    def check_type; '2'; end
    assert '2', token_parser.parse_arr(arr)
  end
  3
  def test_parse_arr_operator													# Checks the parsing of the array method with a particular operator
    token_parser = TokenParser.new
    arr = ['+']
    def check_type; '3'; end
    assert '3', token_parser.parse_arr(arr)
  end
 
  def test_parse_arr_keyword													 # Checks the parsing of the array method with a particular keyword
    token_parser = TokenParser.new
    arr = ['LET']
    def check_type; '4'; end
    assert '4', token_parser.parse_arr(arr)
  end
  
  def test_parse_arr_multiple													# Check the parsing of the array method with multiple values
    token_parser = TokenParser.new
    arr = ['LET','x','10']
    assert_equal '421', token_parser.parse_arr(arr)
  end
  
  def test_check_type_num														# Checks the type of method that will be triggered. Checks each case once
    token_parser = TokenParser.new
    def number?(str); true; end
    def variable?(str); false; end
    def operator?(str); false; end
    def keyword?(str); false; end
    def unknown_keyword?(str); false; end
    str = '8'
    assert_equal '1', token_parser.check_type(str)
  end

  def test_check_type_var														# Checks the type of method that will be triggered. Checks each case once
    token_parser = TokenParser.new
    def number?(str); false; end
    def variable?(str); true; end
    def operator?(str); false; end
    def keyword?(str); false; end
    def unknown_keyword?(str); false; end
    str = 'x'
    assert_equal '2', token_parser.check_type(str)
  end
	
  def test_check_type_operator													# Checks the type of method that will be triggered. Checks each case once
    token_parser = TokenParser.new
    def number?(str); false; end
    def variable?(str); false; end
    def operator?(str); true; end
    def keyword?(str); false; end
    def unknown_keyword?(str); false; end
    str = '+'
    assert_equal '3', token_parser.check_type(str)
  end

  def test_check_type_keyword													# Checks the type of method that will be triggered. Checks each case once
    token_parser = TokenParser.new
    def number?(str); false; end
    def variable?(str); false; end
    def operator?(str); false; end
    def keyword?(str); true; end
    def unknown_keyword?(str); false; end
    str = 'QUIT'
    assert_equal '4', token_parser.check_type(str)
  end

  def test_check_type_keyword_unknown											# Checks the type of method that will be triggered. Checks each case once
    token_parser = TokenParser.new
    def number?(str); false; end
    def variable?(str); false; end
    def operator?(str); false; end
    def keyword?(str); false; end
    def unknown_keyword?(str); true; end
    str = 'cheese'
    assert_equal '5', token_parser.check_type(str)
  end

  def test_all_false															# Checks for a CORNER CASE for the check_type method call
    token_parser = TokenParser.new
    def number?(str); false; end
    def variable?(str); false; end
    def operator?(str); false; end
    def keyword?(str); false; end
    def unknown_keyword?(str); false; end
    str = '&'
    assert_equal '0', token_parser.check_type(str)
  end
end
