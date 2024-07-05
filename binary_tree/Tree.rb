require_relative 'Node'

class Tree
  attr_accessor :root

  def initialize(array)
    array = array.uniq.sort
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = array.size / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[(mid + 1)..-1])

    root
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end

    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      min_larger_node = find_min(node.right)
      node.data = min_larger_node.data
      node.right = delete(min_larger_node.data, node.right)
    end

    node
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    if value < node.data
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def level_order
    return [] if @root.nil?

    queue = [@root]
    result = []

    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.data
      queue << node.left if node.left
      queue << node.right if node.right
    end

    result unless block_given?
  end

  def inorder(node = @root, result = [], &block)
    return result if node.nil?

    inorder(node.left, result, &block)
    block_given? ? yield(node) : result << node.data
    inorder(node.right, result, &block)

    result unless block_given?
  end

  def preorder(node = @root, result = [], &block)
    return result if node.nil?

    block_given? ? yield(node) : result << node.data
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)

    result unless block_given?
  end

  def postorder(node = @root, result = [], &block)
    return result if node.nil?

    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    block_given? ? yield(node) : result << node.data

    result unless block_given?
  end

  def height(node = @root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1
  end

  def depth(node, current = @root, depth = 0)
    return -1 if current.nil?
    return depth if current.data == node.data

    if node.data < current.data
      depth(node, current.left, depth + 1)
    else
      depth(node, current.right, depth + 1)
    end
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    array = inorder
    @root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def find_min(node)
    current = node
    current = current.left until current.left.nil?
    current
  end
end
