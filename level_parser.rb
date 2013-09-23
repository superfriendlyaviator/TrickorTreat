Hasu.load 'cell_factory'

class LevelParser

  def initialize(window, path)
    @raw_map = File.open(path).read.lines
    @cell_factory = CellFactory.new(window)
  end

  def parse
    @raw_map.map do |row|
      row.strip.split('').map do |space|
        if empty?(space)
          @cell_factory.empty
        elsif wall?(space)
          @cell_factory.wall
        elsif park?(space)
          @cell_factory.park
        elsif sewer?(space)
          @cell_factory.sewer
        end
      end
    end
  end

  def empty?(char)
    char == ' '
  end

  def wall?(char)
    char == 'X'
  end

  def park?(char)
    char == 'P'
  end

  def sewer?(char)
    char == 'O'
  end

end
