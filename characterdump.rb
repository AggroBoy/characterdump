#! env ruby

require 'set'

a = ""
codepoints = {}

ARGV.each { |filename|
    open(filename, "r:UTF-8") { |f|
        a = f.read()
    }

    a.each_char { |c|
        if c.codepoints[0] > 127 then
            if codepoints[c] then
                codepoints[c] = codepoints[c] + 1
            else
                codepoints[c] = 1
            end
        end
    }
}

codepoints.keys.sort.each { |c|
    puts " %c  : U+%04X  (%d)" % [c, c.codepoints[0], codepoints[c]]
}
