class Goods
  attr_accessor :id,:name,:unit,:price
  
  def initialize str
  @id,@name,@unit,@price =str.split(" ")
  end
  
  def to_s
  "#{@id} #{@name} #{@unit} #{@price}"
  end
end
