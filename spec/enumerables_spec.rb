require "./lib/enumerable_number"

RSpec.describe Enumerable do
  describe "my_each" do
    let(:array) { [1, 2, 3, 4] }

    it "returns the original array" do
      output = []
      array.my_each { |element| output << element }
      expect(output).to eql([1, 2, 3, 4])
    end

    it "returns an enumerable if no code block is passed" do
      expect(array.my_each).to be_a(Enumerable)
    end

    it "runs the code block on each element" do
      output = []
      array.my_each { |element| output << element**2 }
      expect(output).to eql([1, 4, 9, 16])
    end
  end

  describe "my_select" do
    let(:array) { [1, 2, 3, 4, 5, 6] }

    it "returns all items which the given block returns a true value" do
      output = []
      array.my_select { |element| output << element if element.even? }
      expect(output).to eql([2, 4, 6])
    end

    it "returns an enumerable if no code block is passed" do
      expect(array.my_select).to be_a(Enumerable)
    end
  end

  
end
