# Neil Patel & Surim Kim
# CS 1632; Software Quality Assurance
# Professor Bill Laboon
# Deliverable 6; Testing Strategy for RPN+
class ArgsChecker
  # Accepts an array of command line arguments.
  # If 0 arguments => @return true
  # If > 0 arguments => @return false
  def check_mode(arr)
    return true if arr.count.zero?
    false
  end
end
