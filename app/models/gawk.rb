class Gawk < ActiveRecord::Base
  belongs_to :address

  has_many :prospects
  has_many :results, through: :prospects
end
