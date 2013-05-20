require 'test_helper'

class Admin::PrototypesControllerTest < ActionController::TestCase
  let(:prototype){ FactoryGirl.create(:prototype) }

  setup do
    @user = login
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prototypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prototype" do
    assert_difference('Prototype.count') do
      post :create, prototype: { name: "name" }
    end

    assert_redirected_to admin_prototypes_path
  end

  test "should get edit" do
    get :edit, id: prototype.permalink
    assert_response :success
  end

  test "should update prototype" do
    put :update, id: prototype, prototype: { name: "name" }
    assert_redirected_to admin_prototypes_path
  end

  test "should destroy prototype" do
    prototype
    
    assert_difference('Prototype.count', -1) do
      delete :destroy, id: prototype.permalink
    end

    assert_redirected_to admin_prototypes_path
  end
end
