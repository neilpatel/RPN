# Neil Patel & Surim Kim
class TokenParser
  def input_to_arr(str)
    str.split(' ')
  end

  def parse_arr(arr)
    str = ''

    arr.each do |x|
      str << check_type(x)
    end

    str
  end

  def check_type(str)
    return '1' if number?(str)
    return '2' if variable?(str)
    return '3' if operator?(str)
    return '4' if keyword?(str)
    return '5' if unknown_keyword?(str)
    '0'
  end

  def number?(str)
    str.to_s.match(/\A[-+]?\d+\z/)
  end

  def variable?(str)
    /^[A-Z]{1}$/ =~ str.upcase
  end

  def operator?(str)
    operators = %w[+ - * /]
    operators.include?(str)
  end

  def keyword?(str)
    keywords = %w[LET PRINT QUIT]
    keywords.include?(str.upcase)
  end

  def unknown_keyword?(str)
    /^[A-Z]{2,}$/ =~ str.upcase
  end
end
