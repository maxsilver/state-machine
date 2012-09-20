# Reggie.
# The regular expression parser.

class Reggie
  def initialize(pattern)
    @pattern = pattern[1..-2] # everything inside of / and /
  end

  def =~(str)
    matched_offset = 0
    pindex = 0
    sindex = 0
    has_full_match = false

    loop do

      if str[sindex] == @pattern[pindex]
        sindex += 1
        pindex += 1

        has_full_match = true if @pattern[pindex + 1] == nil
      else
        sindex += 1
        matched_offset = sindex
        pindex = 0
      end

      return matched_offset if pindex > @pattern.length
      return matched_offset if has_full_match
      return nil if sindex > str.length
    end
  end
end
