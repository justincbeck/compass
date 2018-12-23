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
  end
end