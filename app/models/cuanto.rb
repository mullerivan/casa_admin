class Cuanto < ActiveRecord::Base
  belongs_to :persona
  belongs_to :food
  attr_accessible :canitdad
end
