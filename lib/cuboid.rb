
class Cuboid

  InvalidOriginError = Class.new(StandardError)
  InvalidDimensionsError = Class.new(StandardError)
  InvalidMoveError = Class.new(StandardError)


  def initialize(params = {})
    validate_params(params)

    @x = params[:x]
    @y = params[:y]
    @z = params[:z]
    @length = params[:length]
    @width = params[:width]
    @height = params[:height]
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

  # move cuboid origin and return new verticies unless new origin is invalid
  def move_to!(x, y, z)
    raise InvalidMoveError if x < 0 || y < 0 || z < 0

    @x = x
    @y = y
    @z = z

    vertices
  end

  # returns true if the two cuboids intersect each other.  False otherwise.
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

  # detect if point is within origin and origin plus offset
  def point_inside?(x_other, y_other, z_other)
    (x_other >= @x && x_other <= @x + @width) &&
    (y_other >= @y && y_other <= @y + @height) &&
    (z_other >= @z && z_other <= @z + @length)
  end

  private

  def validate_params(params)
    if params[:x] < 0 || params[:y] < 0 || params[:z] < 0
      raise InvalidOriginError
    elsif params[:length] <= 0 || params[:width] <= 0 || params[:height] <= 0
      raise InvalidDimensionsError
    end
  end

end
