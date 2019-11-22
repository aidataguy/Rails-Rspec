require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "should save the test" do
    course = Course.new
    assert_not course.save
  end
end
