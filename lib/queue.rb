module Launch

  class QueueIsEmpty < StandardError
  end

  class Queue
    def initialize
      @items = []
    end
    def enter(value)
      @items << value
    end

    def empty?
      if @items.length != 0
        return false
      else
        return true
      end
    end

    def peek
      @items[0]
    end

    def leave
      if self.empty?
        raise QueueIsEmpty
      else
        @items.shift
      end
    end

    def char_count
      count = {}
      @items.each do |item|
        if count[item]
          count[item] += 1
        else
          count[item] = 1
        end
      end
      return count
    end
  end
end
