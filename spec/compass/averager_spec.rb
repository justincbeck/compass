require 'spec_helper'

module Compass
  RSpec.describe Averager do
    context "#average all the degrees" do
      let(:averager) { Averager.new }

      it "average two degree degree values in quadrant 1" do
        expect((averager.average(5, 85)).round(1)).to eql(45.0)
      end

      it "average two degree values in quadrant 2" do
        expect(averager.average(95, 175)).to eql(135.0)
      end

      it "average two degree values in quadrant 3" do
        expect(averager.average(185, 265)).to eql(225.0)
      end

      it "average two degree values in quadrant 4" do
        expect(averager.average(275, 355)).to eql(315.0)
      end

      it "average two degree values in quadrants 1 & 2" do
        expect(averager.average(45, 135)).to eql(90.0)
      end

      it "average two degree values in quadrants 2 & 3" do
        expect(averager.average(135, 225)).to eql(180.0)
      end

      it "average two degree values in quadrants 3 & 4" do
        expect(averager.average(225, 315)).to eql(270.0)
      end

      it "average two degree values in quadrants 1 & 3 (delta < 180)" do
        expect(averager.average(50, 220)).to eql(135.0)
      end

      it "average two degree values in quadrants 2 & 4 (delta < 180)" do
        expect(averager.average(140, 310)).to eql(225.0)
      end

      it "average two degree values in quadrants 1 & 3 (delta > 180)" do
        expect(averager.average(40, 230)).to eql(315.0)
      end

      it "average two degree values in quadrants 2 & 4 (delta > 180)" do
        expect((averager.average(130, 320)).round(1)).to eql(45.0)
      end
    end

    context "#average all the radians" do
      let(:averager) { Averager.new }

      it "average two degree degree values in quadrant 1" do
        expect(averager.average(0.08726646259971647, 1.48352986419518, true)).to eql(0.7853981633974482)
      end

      it "average two degree values in quadrant 2" do
        expect(averager.average(1.6580627893946132, 3.0543261909900767, true)).to eql(2.356194490192345)
      end

      it "average two degree values in quadrant 3" do
        expect(averager.average(3.2288591161895095, 4.625122517784973, true)).to eql(3.9269908169872414)
      end

      it "average two degree values in quadrant 4" do
        expect(averager.average(4.799655442984406, 6.19591884457987, true)).to eql(5.497787143782138)
      end

      it "average two degree values in quadrants 1 & 2" do
        expect(averager.average(0.7853981633974483, 2.356194490192345, true)).to eql(1.5707963267948966)
      end

      it "average two degree values in quadrants 2 & 3" do
        expect(averager.average(2.356194490192345, 3.9269908169872414, true)).to eql(3.141592653589793)
      end

      it "average two degree values in quadrants 3 & 4" do
        expect(averager.average(3.9269908169872414, 5.497787143782138, true)).to eql(4.71238898038469)
      end

      it "average two degree values in quadrants 1 & 3 (delta < 180)" do
        expect(averager.average(0.8726646259971648, 3.839724354387525, true)).to eql(2.356194490192345)
      end

      it "average two degree values in quadrants 2 & 4 (delta < 180)" do
        expect(averager.average(2.443460952792061, 5.410520681182422, true)).to eql(3.9269908169872414)
      end

      it "average two degree values in quadrants 1 & 3 (delta > 180)" do
        expect(averager.average(0.6981317007977318, 4.014257279586958, true)).to eql(5.497787143782138)
      end

      it "average two degree values in quadrants 2 & 4 (delta > 180)" do
        expect(averager.average(2.2689280275926285, 5.585053606381854, true)).to eql(0.7853981633974492)
      end
    end

    context "#convert to radians" do
      let(:averager) { Averager.new }

      it "converts 360 degrees to 2pi radians" do
        expect(averager.convert_to_radians(360)).to eql(2 * Math::PI)
      end

      it "converts 270 degrees to 3pi/2 radians" do
        expect(averager.convert_to_radians(270)).to eql(3 * Math::PI / 2)
      end

      it "converts 180 degrees to pi radians" do
        expect(averager.convert_to_radians(180)).to eql(Math::PI)
      end

      it "converts 90 degrees to pi/2 radians" do
        expect(averager.convert_to_radians(90)).to eql(Math::PI / 2)
      end
    end
  end
end