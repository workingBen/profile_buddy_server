require 'test_helper'
require 'pry'

class ProfileTest < ActiveSupport::TestCase
  fixtures :profiles

  test "new profiles are valid and have a username" do
    ben = profiles(:ben)

    assert ben.valid?
    assert_not_nil ben.username
  end

  test "usernames are unique" do
    ben = profiles(:ben)
    other_ben = Profile.new({
      username: ben.username
    })

    assert ben.valid?
    assert !other_ben.valid?
  end
end
