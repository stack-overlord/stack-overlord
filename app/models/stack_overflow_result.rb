class StackOverflowResult
  attr_reader :title, :url
  def initialize(title, url)
    @title = title
    @url = url
  end

  def ==(other)
    self.url == other.url
  end

end
