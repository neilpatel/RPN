# Neil Patel & Surim Kim
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+
class ErrorHandler
  VALS_REGEX = /^[1-2]{2,}$/
  UNKNOWN_KEY_REGEX = /[5]{1,}/

  # Matches str string to appropriate regex to determine call
  # If str matches UNKNOWN_KEY_REGEX, call unknown_key method
  def decider(arr, str, l_n)
    return 'Elements in stack after evaluation' if str.match(VALS_REGEX)
    return unknown_key(arr, str) if str.match(UNKNOWN_KEY_REGEX)
    "Line #{l_n.get}: Could not evaluate expression"
  end

  # When decider returns call unknown_key, display what the unknown keyword is
  def unknown_key(arr, str)
    arr.each_with_index do |x, i|
      return "Unknown keyword #{x.upcase}" if str[i] == '5'
    end
  end
end
