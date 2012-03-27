require "rubygems"

class GameOfLife

  def initialize
    @box_length = 10
    @box_width = 10

    @squares = Hash.new

    @squares[[1, 2]] = true
    @squares[[2, 2]] = true
    @squares[[1, 1]] = true
    @squares[[3, 1]] = true
    @squares[[2, 1]] = true
    @squares[[1, 3]] = true
    @squares[[1, 4]] = true
  end


  def tick
    @box_length.times do |y|
      @box_width.times do |x|

        neighbour_count = neighbour_count(x, y)
        if @squares[[x, y]] == true and (neighbour_count == 2 or neighbour_count == 3)
          @squares[[x, y]] = true
        elsif @squares[[x, y]] != true and neighbour_count ==3
          @squares[[x, y]] = true
        else
          @squares[[x, y]] = false
        end

      end
    end
  end


  def neighbour_count(original_x, original_y)
    count = 0

    [original_y-1, original_y, original_y+1].each do |y|
      [original_x-1, original_x, original_x+1].each do |x|
        itself = (x == original_x and y == original_y)
        count+=1 if @squares[[x, y]] == true and !itself
      end
    end

    count
  end


  def display

    puts "...............Ticking............."

    @box_length.times do |y|
      @box_width.times do |x|
        print "X" if @squares[[x, y]] == true
        print "-" if @squares[[x, y]] != true
      end
      puts "\n"
    end
  end

end

game = GameOfLife.new

while true
  game.display
  game.tick
  sleep(3)
end

