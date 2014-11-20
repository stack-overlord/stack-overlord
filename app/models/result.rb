class Result < ActiveRecord::Base
  belongs_to :prospect

  before_create :get_title, :get_link

  query = "#{prospect.gawk.error} + " " + #{prospect.gawk.message}"

  def escape_query(query)
    URI.escape(query)
  end

  def make_stack_api_url(escaped_query)
    "https://api.stackexchange.com/2.2/search/advanced?page=1&pagesize=3&order=desc&sort=relevance&q=#{escaped_query}&tagged=ruby&site=stackoverflow"
  end

  def parse_stack_api(query)
    open(make_stack_api_url(escape_query(query))) {|page| page.read }
  end

  def make_api_hash(query)
  JSON.parse(parse_stack_api(query))["items"][0]#only looks at first result for now
  end

  def get_title
    make_api_hash(query)["title"].gsub("&quot;", "'")
  end

  def get_link
    make_api_hash(query)["link"]
  end

end
