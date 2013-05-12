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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prototype" do
    assert_difference('Prototype.count') do
      post :create, prototype: { name: "name" }
    end

    assert_redirected_to prototype_path(assigns(:prototype))
  end

  test "should show prototype" do
    get :show, id: prototype.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: prototype.id
    assert_response :success
  end

  test "should update prototype" do
    put :update, id: prototype, prototype: { name: "name" }
    assert_redirected_to prototype_path(assigns(:prototype))
  end

  test "should destroy prototype" do
    prototype
    
    assert_difference('Prototype.count', -1) do
      delete :destroy, id: prototype.id
    end

    assert_redirected_to prototypes_path
  end
end
