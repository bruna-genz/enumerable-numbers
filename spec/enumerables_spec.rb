require "./lib/enumerable_number"

RSpec.describe Enumerable do
  describe "my_each" do
    let(:array) { [1, 2, 3, 4] }

    it "returns the original array" do
      output = []
      array.my_each { |element| output << element }
      expect(output).to eql([1, 2, 3, 4])
    end

    it "returns an enumerable if no code block is given" do
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

    it "returns an enumerable if no code block is given" do
      expect(array.my_select).to be_a(Enumerable)
    end
  end

  describe "my_all?" do
    context "when code block is given" do
      it "returns true if the block never returns false or nil" do
        expect([1, 2, 3].my_all? { |element| element > 0 }).to eql(true)
      end
    end

    context "when code block is given" do
      it "returns true if the block never returns false or nil" do
        expect([1, 2, 3].my_all? { |element| element > 1 }).to eql(false)
      end
    end

    context "when no code block is given" do
      it "returns true when none of the elements are false or nil" do
        expect([1, 2, 3].my_all?).to eql(true)
      end
    end

    context "when no code block is given" do
      it "returns true when none of the elements are false or nil" do
        expect([1, 2, nil].my_all?).to eql(false)
      end
    end

    context "when no code block is given" do
      it "returns true when none of the elements are false or nil" do
        expect([].my_all?).to eql(true)
      end
    end
  end

  describe "my_count" do
    let(:array) { [1, 2, 3, 2] }
    
    context "when no code block is given" do
      it "returns the number of elements" do
        expect(array.my_count).to eql(4)
      end
    end

    context "when an argument is given" do
      it "returns the number of elements which are equal to the argument" do
        expect(array.my_count(2)).to eql(2)
      end
    end

    context "when code block is given" do
      it "returns the number of elements for which the block returns a true value" do
        expect(array.my_count { |element| element.even? }).to eql(2)
      end
    end
  end
end
