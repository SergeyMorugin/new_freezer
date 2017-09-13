class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || Hash.new(0)
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def total
    contents.map do |content|
      item = Item.find_by(id: content.first)
      item.price * content.last
    end.sum
  end
end
