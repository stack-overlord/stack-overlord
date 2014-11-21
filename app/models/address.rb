class Address < ActiveRecord::Base
  has_many :gawks

  def to_param
    mash
  end
end
