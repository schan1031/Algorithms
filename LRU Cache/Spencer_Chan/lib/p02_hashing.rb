class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    self.map(&:hash).reduce(:-)
  end
end

class String
  def hash
    alpha = 'abcdefghijklmnopqrstuvwxyz'.chars
    out = self.chars.map { |el| el = alpha.index(el) }
    out.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    out = 0
    self.keys.each do |k|
      out += k.hash - self[k].hash
    end
    out
  end
end
