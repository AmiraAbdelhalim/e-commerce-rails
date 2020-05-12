require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "should not save Brand without name" do
    brand = Brand.new
    assert_not brand.save
  end
  
  test "should not save Brand without numeric name" do
    brand = Brand.new
    brand.name="4444"
    assert_not brand.save
  end

  test "should save Brand With  name" do
    brand = Brand.new
    brand.name="testname"
    assert brand.save
    
  end
end
