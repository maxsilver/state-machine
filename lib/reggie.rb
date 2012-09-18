# Reggie.
# The regular expression parser.

class Reggie
  def initialize(pattern)
    @pattern = pattern[1..-2] # everything inside of / and /
  end

  def =~(str)
    sindex = 0

    loop do
      if str[sindex] == @pattern
        return sindex
      end
      sindex += 1

      return nil if sindex > str.length
    end

  end
end
