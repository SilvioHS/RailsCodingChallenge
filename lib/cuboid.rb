
class Cuboid

  def initialize(params = {})
    @x = params[:x]
    @y = params[:y]
    @z = params[:z]
    @length = params[:length].abs
    @width = params[:width].abs
    @height = params[:height].abs
  end

  def vertices
    [
      { x: @x,          y: @y,            z: @z},
      { x: @x + @width, y: @y,            z: @z},
      { x: @x,          y: @y + @height,  z: @z},
      { x: @x + @width, y: @y + @height,  z: @z},
      { x: @x,          y: @y,            z: @z + @length},
      { x: @x + @width, y: @y,            z: @z + @length},
      { x: @x,          y: @y + @height,  z: @z + @length},
      { x: @x + @width, y: @y + @height,  z: @z + @length}
    ]
  end

  def volume
    @width * @height * @length
  end

  def move_to!(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    if self.volume > other.volume
      smaller_cuboid = other
      larger_cuboid = self
    else
      smaller_cuboid = self
      larger_cuboid = other
    end

    smaller_cuboid.vertices.each do |point|
      return true if larger_cuboid.point_inside?(point[:x], point[:y], point[:z])
    end

    return false
  end

  def point_inside?(x_other, y_other, z_other)
    # detect if point is within origin and origin plus offset (also account for negative offset)
    (x_other >= @x && x_other <= @x + @width) &&
    (y_other >= @y && y_other <= @y + @height) &&
    (z_other >= @z && z_other <= @z + @length)
  end

end
