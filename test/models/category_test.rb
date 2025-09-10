require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "summary must be present" do
    category = Category.new(note: "")
    assert !category.valid?, "note must be present"
  end

  test "description line" do
    category = Category.new(description: "")
    assert !category.valid?, "must have a snippet or summary of journal"
  end

  test "number line must be filled" do
    category = Category.new(number: 1)
    assert !category.valid?, "must be a number"
  end
end
