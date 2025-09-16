require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "note must be present" do
    category = Category.new(description: "lelelelelelel", number: 1)
    assert !category.valid?, "must have note"
  end

  test "will not run without description line" do
    category = Category.new(note: "lioliolio", number: 2)
    assert !category.valid?, "must have a snippet or summary of journal"
  end

  test "number line must be filled" do
    category = Category.new(number: -1)
    assert !category.valid?, "must be a number"
  end
end
