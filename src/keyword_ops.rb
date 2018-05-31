require_relative 'line_executor'
require_relative 'let_ops'
require_relative 'print_ops'

# Neil Patel & Surim
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+
class KeywordOperations
  def pik_keyword(arr, str, variables, l_n)
    let_ops = LetOperations.new
    print_ops = PrintOperations.new
    do_let = arr[0].casecmp('LET')
    do_print = arr[0].casecmp('PRINT')

    return let_ops.pik_let_op(arr, str, variables, l_n) if do_let.zero?
    print_ops.pik_print_op(arr, str, variables, l_n) if do_print.zero?
  end

  def clone_array(arr)
    clone = []

    arr.each do |x|
      clone.push(x)
    end

    clone
  end

  def vars_to_nums(arr, variables)
    token_parser = TokenParser.new

    arr.each_with_index do |x, i|
      arr[i] = get_val(x, variables) if token_parser.check_type(x) == '2'
    end

    arr
  end

  def get_val(var, variables)
    return variables.get_val(var) if var_init?(var, variables)
    "variable #{var} is not initialized"
  end

  def var_init?(var, variables)
    return false if variables.get_val(var).nil?
    true
  end

  def check_init(arr)
    arr.each do |x|
      return false, x if x.to_s.include?('variable')
    end

    [true, nil]
  end
end
