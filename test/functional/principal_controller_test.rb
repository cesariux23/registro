# -*- encoding : utf-8 -*-
require 'test_helper'

class PrincipalControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
