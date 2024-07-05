class HashMap
  LOAD_FACTOR = 0.75

  def initialize(size = 8)
    @buckets = Array.new(size) {[]}
    @count = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 0

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    resize if load_factor_exceeded?

    bucket_index = hash(key) % @buckets.size
    bucket = @buckets[bucket_index]

    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    bucket << [key, value]
    @count += 1
  end

  def get(key)
    bucket_index = hash(key) % @buckets.size
    bucket = @buckets[bucket_index]

    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def has?(key)
    !get(key).nil?
  end

  def remove(key)
    bucket_index = hash(key) % @buckets.size
    bucket = @buckets[bucket_index]

    bucket.each_with_index do |pair, index|
      if pair[0] == key
        bucket.delete_at(index)
        @count -= 1
        return pair[1]
      end
    end

    nil
  end

  def length
    @count
  end

  def clear
    @buckets = Array.new(@buckets.size) {[]}
    @count = 0
  end

  def keys
    @buckets.flatten(1).map {|pair| pair[0]}
  end

  def values
    @buckets.flatten(1).map {|pair| pair[1]}
  end

  def entries
    @buckets.flatten(1)
  end

  private

  def load_factor_exceeded?
    @count.to_f / @buckets.size > LOAD_FACTOR
  end

  def resize
    old_buckets = @buckets
    @buckets = Array.new(@buckets.size * 2) {[]}

    @count = 0

    old_buckets.flatten(1).each do |pair|
      set(pair[0], pair[1])

    end

  end

end
