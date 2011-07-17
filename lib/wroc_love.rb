require 'date'

module WrocLove
  autoload :Airport, 'wroc_love/airport'

  Arrival = Date.new(2012, 3, 9)
  From    = Date.new(2012, 3, 10)
  To      = Date.new(2012, 3, 11)
  Return  = Date.new(2012, 3, 11)
end
