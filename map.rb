Hasu.load "cell_factory.rb"

class Map

  def initialize(window)
    @window = window
    @cell_factory = CellFactory.new(window)
    @grid_height = window.height.to_f / @cell_factory.height
    @grid_width = window.width.to_f / @cell_factory.width
    @grid = build_grid
  end

  def draw
    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.draw(x, y)
      end
    end
  end


  private

  def center_row
    [@cell_factory.wall] + [@cell_factory.empty].cycle.take(@grid_width - 2) + [@cell_factory.wall]
  end

  def edge_row
    [@cell_factory.wall].cycle.take(@grid_width)
  end

  def build_grid
    [edge_row] +
    [center_row].cycle.take(@grid_height-5) +
    [edge_row] +
    [center_row] +
    [center_row] +
    [edge_row]
  end


end
