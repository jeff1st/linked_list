class Node
  attr_accessor :value, :next_node

  def initialize(val=nil)
    @value = val
    @next_node = nil
  end
end

class LinkedList

  def initialize(val=nil)
    @head = Node.new val
    @current = @head
  end

  def append(val)
    (@head.value = val; return self.to_s) if @head.value.nil?
    new_node = Node.new val
    @current.next_node = new_node
    @current = new_node
  end

  def prepend(val)
    (@head.value = val; return self.to_s) if @head.value.nil?
    new_node = Node.new val
    new_node.next_node = @head
    @head = new_node
  end

  def head
    @head.value
  end

  def tail
    @current.value
  end

  def size
    size = 1
    current_node = @head
    return size if @head.next_node.nil?
    while true
      size += 1
      current_node = current_node.next_node
      break if current_node.next_node.nil?
    end
    return size
  end

  def at(index)
    returned_index = 0
    current_node = @head
    return puts "Error, index not in linked_list" if (index > (self.size - 1) || index < 0)
    return @head.value if @head.next_node.nil?
    while true
      return current_node.value if index == returned_index
      current_node = current_node.next_node
      returned_index += 1
    end
  end

  def pop
    if self.size == 1
      data = @head.value
      @head.value = nil
      return data
    end

    current_node = @head
    while true
      prec_node = current_node
      current_node = current_node.next_node
      break if current_node == @current
    end
    prec_node.next_node = nil
    @current = prec_node
    return current_node.value
  end

  def contains?(data)
    current_node = @head
    while true
      return true if current_node.value == data
      break if current_node.next_node.nil?
      current_node = current_node.next_node
    end
    return false
  end

  def find(data)
    current_node = @head
    index = 0
    while true
      return index if current_node.value == data
      break if current_node.next_node.nil?
      current_node = current_node.next_node
      index += 1
    end
    return nil
  end 

  def insert_at(index, val)
    current_node = @head
    current_index = 0

    return puts "Error, index not in list" if (index > (self.size) || index < 0)

    if @head.value.nil?
      self.append val
      return self.to_s
    end

    if index == 0
      self.prepend val
      return self.to_s
    end

    while true
      current_index += 1
      prec = current_node
      follow = current_node.next_node
      if index == current_index
        current = Node.new val
        prec.next_node = current
        current.next_node = follow
        return self.to_s
      end
      current_node = follow
    end
  end

  def remove_at(index)

  end

  def to_s
    current_node = @head
    string = ""
    index = 0
    while true
      string += "#{current_node.value ? current_node.value : "nil"}: #{index}"
      current_node = current_node.next_node
      (string += " -> nil"; break) if current_node.nil?
      string += " -> "
      index += 1
    end
    return "#{string}"
  end
end


