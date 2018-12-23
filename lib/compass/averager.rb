# This module calculates the average
# of two compass bearings

module Compass
  class Averager
    def average(a, b)
      larg = [a, b].max
      rarg = [a, b].min

      if larg - rarg < 180
        # if the delta is less than 180 then we can
        # just add together and divide by 2
        average = (larg + rarg) / 2
      else
        # if the delta is greater than 180 then we
        # need to normalize the scale by adding 360
        # to the smaller number
        rarg = rarg + 360

        # then we can calculate the average as usual
        average = (larg + rarg) / 2

        # then we need to reduce back below 360
        while (average > 360)
          average = average - 360
        end
      end

      puts "Average: #{average}"
    end
  end
end