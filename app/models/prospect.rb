class Prospect < ActiveRecord::Base
  belongs_to :gawk
  belongs_to :result
end
