require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save task without required fields" do
    task = Task.new(taskname: "A")
    assert !task.save, "Saved the task without required fields"
  end

  test "should not save task without taskname" do
    task = Task.new(details: "Some details", duedate: Date.today)
    assert !task.save, "Saved the task without a taskname"
  end

  test "should not save task without details" do
    task = Task.new(taskname: "Test Task", duedate: Date.today)
    assert !task.save, "Saved the task without details"
  end

  test "should not save task without duedate" do
    task = Task.new(taskname: "Test Task", details: "Some details")
    assert !task.save, "Saved the task without duedate"
  end

  test "should not save task without category" do
    task = Task.new(taskname: "Test Task", details: "Some details", duedate: Date.today)
    assert_not task.save, "Saved the task without category"
  end
end
