class Photo < ActiveRecord::Base
  has_attached_file :body
  has_many :ratings
end
