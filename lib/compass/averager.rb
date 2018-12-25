# This module calculates the average
# of two compass bearings

module Compass
  class Averager
    
    def average(a, b, radians = false)
      larg = [a, b].max
      rarg = [a, b].min

      if !radians
        lrad = convert_to_radians(larg)
        rrad = convert_to_radians(rarg)
      else
        lrad = larg
        rrad = rarg
      end

      if lrad - rrad < Math::PI
        # if the delta is less than 180 then we can
        # just add together and divide by 2
        average = (lrad + rrad) / 2
      else
        # if the delta is greater than 180 then we
        # need to normalize the scale by adding 360
        # to the smaller number
        rrad = rrad + (2 * Math::PI)

        # then we can calculate the average as usual
        average = (lrad + rrad) / 2

        # then we need to reduce back below 360
        while (average > (2 * Math::PI))
          average = average - (2 * Math::PI)
        end
      end

      average = radians ? average : convert_to_degrees(average)
      average
    end

    def convert_to_radians(degrees)
      (degrees / 180.0) * Math::PI
    end

    def convert_to_degrees(radians)
      radians / Math::PI * 180.0
    end
  end
end