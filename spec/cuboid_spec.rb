require 'cuboid'

describe Cuboid do

  subject(:cuboid1) { Cuboid.new({x: 0, y: 0, z: 0, width: 2, height: 2, length: 2}) }
  subject(:cuboid2) { Cuboid.new({x: 4, y: 4, z: 0, width: 2, height: 2, length: 2}) }
  subject(:cuboid3) { Cuboid.new({x: 1, y: 1, z: 1, width: 1, height: 1, length: 1}) }
  subject(:cuboid4) { Cuboid.new({x: 0, y: 0, z: 0, width: 10, height: 10, length: 10}) }
  subject(:cuboid5) { Cuboid.new({x: 3, y: 3, z: 3, width: 1, height: 1, length: 1}) }

  describe "intersects?" do
    it "returns true if cuboid intersects other cuboid" do
      expect(cuboid1.intersects?(cuboid1)).to eq(true)
      expect(cuboid1.intersects?(cuboid3)).to eq(true)
      expect(cuboid1.intersects?(cuboid4)).to eq(true)
      expect(cuboid4.intersects?(cuboid1)).to eq(true)
    end

    it "return false if cuboid does not intersect other cuboid" do
      expect(cuboid1.intersects?(cuboid2)).to eq(false)
      expect(cuboid1.intersects?(cuboid5)).to eq(false)
      expect(cuboid2.intersects?(cuboid3)).to eq(false)
    end
  end

  describe "vertices" do
    it "returns a list of the cuboids vertices" do
      expect(cuboid1.vertices).to eq(
        [{x: 0, y: 0, z: 0},
        {x: 2, y: 0, z: 0},
        {x: 0, y: 2, z: 0},
        {x: 2, y: 2, z: 0},
        {x: 0, y: 0, z: 2},
        {x: 2, y: 0, z: 2},
        {x: 0, y: 2, z: 2},
        {x: 2, y: 2, z: 2}]
      )
    end
  end

  describe "move_to" do
    it "changes the origin in the simple happy case" do
      expect(cuboid1.move_to!(1,2,3)).to eq(
        [{x: 1, y: 2, z: 3},
        {x: 3, y: 2, z: 3},
        {x: 1, y: 4, z: 3},
        {x: 3, y: 4, z: 3},
        {x: 1, y: 2, z: 5},
        {x: 3, y: 2, z: 5},
        {x: 1, y: 4, z: 5},
        {x: 3, y: 4, z: 5}]
      )
    end

    it "raises error if new origin is invalid" do
      expect {cuboid1.move_to!(-1,2,3)}.to raise_error(Cuboid::InvalidMoveError)
    end
  end

end
