module GawksHelper

  def make_query(query)
    URI.escape(query)
  end

end
