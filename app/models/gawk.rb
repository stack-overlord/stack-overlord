class Gawk < ActiveRecord::Base
  has_many :triggers
  has_many :prospects
  has_many :results, through: :prospects
end
