Hasu.load "cell_factory.rb"
Hasu.load "level_parser.rb"

class Map

  def initialize(window)
    @window = window
    @level_parser = LevelParser.new(window, 'level1.txt')
    @space_height = 32
    @space_width = 32
    @grid_height = (window.height.to_f / @space_height).to_i
    @grid_width = (window.width.to_f / @space_width).to_i
    @grid = build_grid
    assign_cell_positions!
  end

  def draw
    @grid.each do |row|
      row.each do |cell|
        cell.draw
      end
    end
  end

  def wall_collision?(player)
    player_bounds = player.bounds
    [:top, :bottom].each do |y|
      [:left, :right].each do |x|
        if cell_from_pixels(player_bounds[x], player_bounds[y]).blocked?
          return true
        end
      end
    end
    false
  end

  private

  def get_cell(x, y)
    @grid[y][x]
  end

  def cell_from_pixels(x, y)
    pos = pixels_to_coords(x, y)
    get_cell(pos[:x], pos[:y])
  end

  def pixels_to_coords(x, y)
    { 
      x: (x.to_f / @space_width).to_i,
      y: (y.to_f / @space_height).to_i
    }
  end

  def center_row
    [@cell_factory.wall] +
    (@grid_width - 2).times.map { @cell_factory.empty } +
    [@cell_factory.wall]
  end

  def odd_row
    [@cell_factory.wall] +
    [@cell_factory.empty, @cell_factory.empty, @cell_factory.wall, @cell_factory.wall, @cell_factory.empty, @cell_factory.wall] +
    [@cell_factory.empty, @cell_factory.empty, @cell_factory.wall, @cell_factory.wall, @cell_factory.empty, @cell_factory.wall] +
    [@cell_factory.empty, @cell_factory.empty, @cell_factory.wall, @cell_factory.wall, @cell_factory.empty, @cell_factory.wall] +
    [@cell_factory.wall]
  end

  def edge_row
    (@grid_width).times.map { @cell_factory.wall }
  end

  def build_grid
    @level_parser.parse
    # [edge_row] +
    # (@grid_height - 5).times.map { center_row } +
    # [odd_row] +
    # [center_row] +
    # [center_row] +
    # [edge_row]
  end

  def assign_cell_positions!
    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.set_grid_position(x, y)
      end
    end
  end


end
