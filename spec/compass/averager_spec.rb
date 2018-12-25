require 'spec_helper'

module Compass
  RSpec.describe Averager do
    context "#average" do
      let(:averager) { Averager.new }

      it "average two values in quadrant 1" do
        expect { averager.average(5, 85) }.to output("Average: 45\n").to_stdout
      end

      it "average two values in quadrant 2" do
        expect { averager.average(95, 175) }.to output("Average: 135\n").to_stdout
      end

      it "average two values in quadrant 3" do
        expect { averager.average(185, 265) }.to output("Average: 225\n").to_stdout
      end

      it "average two values in quadrant 4" do
        expect { averager.average(275, 355) }.to output("Average: 315\n").to_stdout
      end

      it "average two values in quadrants 1 & 2" do
        expect { averager.average(45, 135) }.to output("Average: 90\n").to_stdout
      end

      it "average two values in quadrants 2 & 3" do
        expect { averager.average(135, 225) }.to output("Average: 180\n").to_stdout
      end

      it "average two values in quadrants 3 & 4" do
        expect { averager.average(225, 315) }.to output("Average: 270\n").to_stdout
      end

      it "average two values in quadrants 1 & 3 (delta < 180)" do
        expect { averager.average(50, 220) }.to output("Average: 135\n").to_stdout
      end

      it "average two values in quadrants 2 & 4 (delta < 180)" do
        expect { averager.average(140, 310) }.to output("Average: 225\n").to_stdout
      end

      it "average two values in quadrants 1 & 3 (delta > 180)" do
        expect { averager.average(40, 230) }.to output("Average: 315\n").to_stdout
      end

      it "average two values in quadrants 2 & 4 (delta > 180)" do
        expect { averager.average(130, 320) }.to output("Average: 45\n").to_stdout
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