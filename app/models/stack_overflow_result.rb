class StackOverFlowResult
  attr_reader :title, :url
  def initialize(title, url)
    @title = title
    @url = url
  end

  def ==(other)
    self.url == other.url
  end

  def attributes
    {url: self.url, title: self.title}
  end
end
