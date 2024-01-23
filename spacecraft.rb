class Spacecraft
  attr_accessor :position, :direction, :dir

  def initialize(x, y, z, direction)
    @position = { 'x' => x, 'y' => y, 'z' => z }
    @direction = direction
  end

  def move_forward
    case @direction
      when 'N' then @position['y'] += 1
      when 'S' then @position['y'] -= 1
      when 'E' then @position['x'] += 1
      when 'W' then @position['x'] -= 1
      when 'Up' then @position['z'] += 1
      when 'Down' then @position['z'] -= 1
    end
  end

  def move_backward
    case @direction
      when 'N' then @position['y'] -= 1
      when 'S' then @position['y'] += 1
      when 'E' then @position['x'] -= 1
      when 'W' then @position['x'] += 1
      when 'Up' then @position['z'] -= 1
      when 'Down' then @position['z'] += 1
    end
  end

  def turn_left
    if @direction == 'Up' || @direction == 'Down'
      @direction=@dir
    end

    @direction = case @direction
                   when 'N' then 'W'
                   when 'S' then 'E'
                   when 'E' then 'N'
                   when 'W' then 'S'
                 else @direction
                 end
  end

  def turn_right
    if @direction == 'Up' || @direction == 'Down'
      @direction=@dir
    end

    @direction = case @direction
                 when 'N' then 'E'
                 when 'S' then 'W'
                 when 'E' then 'S'
                 when 'W' then 'N'
                 else @direction
                 end
  end

  def turn_up
    @dir=@direction
    @direction = 'Up' 
  end

  def turn_down
    @dir=@direction
    @direction = 'Down' 
  end

  def execute_commands(commands)
    commands.each do |command|
      case command
      when 'f' then move_forward
      when 'b' then move_backward
      when 'l' then turn_left
      when 'r' then turn_right
      when 'u' then turn_up
      when 'd' then turn_down
      end
    end
  end

end