module Life
  class World

    attr_reader :state

    def initialize(state)
      @state = state
    end

    def tick
      World.new(@state.map.with_index do |row, row_num|
        row.map.with_index do |cell, col_num|
          num_neighbours = number_of_neighbours(row_num, col_num)

          case(num_neighbours)
          when 0,1
            0
          when 2
            @state[row_num][col_num]
          when 3
            1
          when 4..8
            0
          end
        end
      end)
    end

    private

    def number_of_neighbours(x, y)
      [
        [-1,-1], [ 0, -1], [ 1, -1],
        [-1, 0], [ 1, 0],
        [-1, 1], [ 0, 1], [ 1, 1],
      ].inject(0) do |memo, offset|
        new_x = x + offset[0]
        new_y = y + offset[1]

        if valid_position?(new_x, new_y)
          res = @state[new_x][new_y]
        else
          res = 0
        end

        memo + res
      end
    end

    def valid_position?(x,y)
      return false if x < 0 || x >= @state.length
      row = @state.first
      return false if row.nil? || y < 0 || y >= row.length

      true
    end

  end
end
