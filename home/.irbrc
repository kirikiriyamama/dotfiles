require 'pp'
require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:INSPECT_MODE] = :pp
IRB.conf[:USE_AUTOCOMPLETE] = false
