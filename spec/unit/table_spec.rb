require 'spec_helper'

describe Table do
  describe "#position_available?" do
    it "returns true with valid arguments" do
      position_available = subject.position_available?(
        x_position: 1,
        y_position: 2
      )

      expect(position_available).to eq(true)
    end

    it "returns false with an invalid x_position" do
      position_available = subject.position_available?(
        x_position: -1,
        y_position: 2
      )

      expect(position_available).to eq(false)
    end

    it "returns false with an invalid y_position" do
      position_available = subject.position_available?(
        x_position: 1,
        y_position: 'bob'
      )

      expect(position_available).to eq(false)
    end

    it "returns false with an missing y_position " do
      position_available = subject.position_available?(
        x_position: 1,
        y_position: nil
      )

      expect(position_available).to eq(false)
    end
  end
end
