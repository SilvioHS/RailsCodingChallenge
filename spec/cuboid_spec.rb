require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  subject(:cuboid1) {
    Cuboid.new({
      x: 0,
      y: 0,
      z: 0,
      width: 2,
      height: 2,
      length: 2,
    })
  }

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

  describe "point_inside?" do
    it "returns true if a point is inside the cuboid" do
      expect(cuboid1.point_inside?(0,0,0)).to eq(true)
      expect(cuboid1.point_inside?(0,0,2)).to eq(true)
      expect(cuboid1.point_inside?(0,2,0)).to eq(true)
      expect(cuboid1.point_inside?(0,2,2)).to eq(true)
      expect(cuboid1.point_inside?(2,0,0)).to eq(true)
      expect(cuboid1.point_inside?(2,0,2)).to eq(true)
      expect(cuboid1.point_inside?(2,2,0)).to eq(true)
      expect(cuboid1.point_inside?(2,2,2)).to eq(true)
      expect(cuboid1.point_inside?(1,1,1)).to eq(true)
    end

    it "returns false if a point is outside the cuboid" do
      expect(cuboid1.point_inside?(-1,-1,-1)).to eq(false)
      expect(cuboid1.point_inside?(3,3,3)).to eq(false)
      expect(cuboid1.point_inside?(0,0,5)).to eq(false)
      expect(cuboid1.point_inside?(0,5,0)).to eq(false)
      expect(cuboid1.point_inside?(5,0,0)).to eq(false)
      expect(cuboid1.point_inside?(-5,0,0)).to eq(false)
      expect(cuboid1.point_inside?(0,-5,0)).to eq(false)
      expect(cuboid1.point_inside?(0,0,-5)).to eq(false)
    end
  end

end
