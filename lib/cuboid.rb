
class Cuboid

  #BEGIN public methods that should be your starting point

  def initialize(params = {})
    @x = params[:x]
    @y = params[:y]
    @z = params[:z]
    @length = params[:length]
    @width = params[:width]
    @height = params[:height]
  end

  def move_to!(x, y, z)
    @x = x
    @y = y
    @z = z
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

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  def point_inside?(x_other, y_other, z_other)
    (x_other >= @x && x_other <= @x + @width || x_other <= @x && x_other >= @x + @width) &&
    (y_other >= @y && y_other <= @y + @height || y_other <= @y && y_other >= @y + @height) &&
    (z_other >= @z && z_other <= @z + @length || z_other <= @z && z_other >= @z + @length)
  end

  #END public methods that should be your starting point
end
