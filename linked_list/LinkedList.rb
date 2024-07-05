require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)

    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next while current.next
      current.next = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  def delete(data)
    return if @head.nil?

    if @head.data == data
      @head = @head.next
      return
    end

    current = @head
    while current.next  && current.next.data != data
      current = current.next
    end

    current.next = current.next.next if current.next

  end

  def display
    current = @head
    while current
      print "#{current.data} -> "
      current = current.next
    end
    puts 'end'
  end

end
