# frozen_string_literal:true

require "./lib/enumerable_number"

describe Enumerable do
  describe "my_each" do
    it "returns an enumerable if not passed a block" do
      expect([1, 2, 3].my_each).to be_a(Enumerable)
    end
  end
end
