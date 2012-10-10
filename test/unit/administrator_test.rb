require 'test_helper'

class AdministratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "authenticate" do
    administrator = Factory(:administrator,
                            name: "taro",
                            email: "taro@a.com",
                            password: "test",
                            password_confirmation: "test")
    assert_nil Administrator.authenticate("taro", "prod")
    assert_equal administrator, Administrator.authenticate("taro", "test")
  end
end
