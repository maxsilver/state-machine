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

      # pattern and string letters match. "d" == /d/
      if (str[sindex] == @pattern[pindex])
        sindex += 1
        pindex += 1
        has_full_match = true if @pattern[pindex] == nil

      # pattern is wildcard. "d" == /./
      elsif (@pattern[pindex] == "." && !str[sindex].empty?)
        sindex += 1
        pindex += 1
        has_full_match = true if @pattern[pindex] == nil

      # if pattern is "?" (the zero-or-one is one, it already matched)
      elsif (@pattern[pindex] == "?")
        pindex += 1
        has_full_match = true if @pattern[pindex] == nil

      # if *next* pattern is "?" (the zero-to-one is a 'zero', won't match)
      elsif (@pattern[pindex + 1] == "?")
        pindex += 2
        has_full_match = true if @pattern[pindex] == nil

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
