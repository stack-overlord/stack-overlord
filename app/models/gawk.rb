class Gawk < ActiveRecord::Base
  attr_accessor :refined

  belongs_to :address

  has_many :prospects
  has_many :results, through: :prospects
end
