class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList

  def initialize(val)
    @start_node = Node.new
    @start_node.value = val
    @current = @start_node
  end

  def append(val)
    new_node = Node.new
    new_node.value = val
    @current.next_node = new_node
    @current = new_node
  end

  def prepend(val)
    new_node = Node.new
    new_node.value = val
    new_node.next_node = @start_node
    @start_node = new_node
  end

  def size
    size = 1
    return size if @start_node.next_node.nil?
    @pointer_node = @start_node
    while true
      size += 1
      @pointer_node = @pointer_node.next_node
      break if @pointer_node.next_node.nil?
    end
    return size
  end

  def to_s
    @pointer_node = @start_node
    string = ""
    index = 0
    while true
      string += "#{@pointer_node.value}: #{index}"
      @pointer_node = @pointer_node.next_node
      (string += " -> nil"; break) if @pointer_node.nil?
      string += " -> "
      index += 1
    end
    puts string
  end
end


