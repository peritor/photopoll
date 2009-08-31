require File.dirname(__FILE__) + '/../test_helper'

class RatingTest < ActiveSupport::TestCase

  def setup
    @photo = Photo.new(:name => 'ABC')
    @photo.save!
  end

  test "needs value" do
    r = Rating.new(:photo => @photo)
    assert !r.valid?
    r.value = 3
    assert r.save, r.errors.inspect
  end
  
  test "value needs to be 1 <= value <= 5" do
    r = Rating.new(:value => 99, :photo => @photo)
    assert !r.valid?
      
    r = Rating.new(:value => -1, :photo => @photo)
    assert !r.valid?
    
    r = Rating.new(:value => 1, :photo => @photo)
    assert r.valid?
  end
end
