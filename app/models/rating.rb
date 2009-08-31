class Rating < ActiveRecord::Base
  
  belongs_to :photo
  validates_presence_of :value, :photo
  validates_inclusion_of :value, :in => [1,2,3,4,5]
  
end
