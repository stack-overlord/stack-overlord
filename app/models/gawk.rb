class Gawk < ActiveRecord::Base
  belongs_to :address

  has_many :prospects
  has_many :results, through: :prospects

  def make_query(error, message)
    "#{error} #{message}"
  end

end
