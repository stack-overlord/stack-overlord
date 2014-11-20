class Trigger < ActiveRecord::Base
  belongs_to :address
  belongs_to :gawk

end
