require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  subject(:cuboid1) { Cuboid.new({x: 0, y: 0, z: 0, width: 2, height: 2, length: 2}) }

  subject(:cuboid2) { Cuboid.new({x: 4, y: 4, z: 0, width: 2, height: 2, length: 2}) }
  subject(:cuboid3) { Cuboid.new({x: 1, y: 1, z: 1, width: 1, height: 1, length: 1}) }
  subject(:cuboid4) { Cuboid.new({x: -5, y: -5, z: -5, width: 10, height: 10, length: 10}) }
  subject(:cuboid5) { Cuboid.new({x: -5, y: -5, z: -5, width: 1, height: 1, length: 1}) }

  subject(:cuboid6) { Cuboid.new({x: -10, y: -1, z: -10, width: 20, height: 2, length: 20}) }
  subject(:cuboid7) { Cuboid.new({x: -1, y: -10, z: -1, width: 2, height: 20, length: 2}) }

  describe "intersects?" do
    it "returns true if cuboid intersects other cuboid" do
      expect(cuboid1.intersects?(cuboid1)).to eq(true)
      expect(cuboid1.intersects?(cuboid3)).to eq(true)
      expect(cuboid1.intersects?(cuboid4)).to eq(true)
      expect(cuboid4.intersects?(cuboid1)).to eq(true)
      expect(cuboid6.intersects?(cuboid7)).to eq(true)
      expect(cuboid7.intersects?(cuboid6)).to eq(true)
    end

    it "return false if cuboid does not intersect other cuboid" do
      expect(cuboid1.intersects?(cuboid2)).to eq(false)
      expect(cuboid1.intersects?(cuboid5)).to eq(false)
      expect(cuboid2.intersects?(cuboid3)).to eq(false)
    end
  end

  describe "vertices" do
    it "returns a list of the cuboids vertices" do
      expect(cuboid1.vertices).to eq([
        {x: 0, y: 0, z: 0},
        {x: 2, y: 0, z: 0},
        {x: 0, y: 2, z: 0},
        {x: 2, y: 2, z: 0},
        {x: 0, y: 0, z: 2},
        {x: 2, y: 0, z: 2},
        {x: 0, y: 2, z: 2},
        {x: 2, y: 2, z: 2}
      ])
    end
  end

  # describe "move_to" do
  #   it "changes the origin in the simple happy case" do
  #     cuboid1.move_to!(1,2,3)
  #     # expect(subject.move_to!(1,2,3)).to be true
  #   end
  # end

end
