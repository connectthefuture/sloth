require 'test_helper'

class PrototypesControllerTest < ActionController::TestCase
  let(:prototype){ FactoryGirl.create(:prototype) }

  setup do
    @user = login
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prototypes)
  end

  test "should show prototype" do
    get :show, id: prototype.permalink
    assert_response :success
    assert_equal prototype, assigns(:prototype)
  end

end
