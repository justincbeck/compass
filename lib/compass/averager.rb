# This module calculates the average
# of two compass bearings

module Compass
  class Averager
    def average(a, b)
      larg = [a, b].max
      rarg = [a, b].min

      if larg - rarg < 180
        average = (larg + rarg) / 2
      else
        rarg = rarg + 360
        average = (larg + rarg) / 2
        while (average > 360)
          average = average - 360
        end
      end

      puts "Average: #{average}"
    end
  end
end