class Address < ActiveRecord::Base
  has_many :triggers
  has_many :gawks, through: :triggers
end
