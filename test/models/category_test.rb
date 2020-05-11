require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end
  test "should not save Category without name" do
    category = Category.new
    assert_not category.save
  end
  
  test "should not save Category without numeric name" do
    category = Category.new
    category.name="4444"
    assert_not category.save
  end

  test "should save Category With  name" do
    category = Category.new
    category.name="testname"
    assert category.save
    
  end
end
