require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:prototype){ page.prototype }

  setup do
    login
  end

  test "should get index" do
    get :index, prototype_id: prototype.permalink
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new, prototype_id: prototype.permalink
    assert_response :success
  end

  test "should create page" do
    prototype = FactoryGirl.create(:prototype)
    
    assert_difference('Page.count') do
      post :create, page: { name: "pie", image: test_image_rack_upload }, prototype_id: prototype.permalink
    end

    assert_redirected_to prototype_page_path(prototype, assigns(:page))
  end

  test "should show page" do
    get :show, id: page.id, prototype_id: prototype.permalink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: page.id, prototype_id: prototype.permalink
    assert_response :success
  end

  test "should update page" do
    put :update, id: page, page: { name: "pie" }, prototype_id: prototype.permalink
    assert_redirected_to prototype_page_path(prototype, assigns(:page))
  end

  test "should destroy page" do
    prototype
    
    assert_difference('Page.count', -1) do
      delete :destroy, id: page.id, prototype_id: prototype.permalink
    end

    assert_redirected_to prototype_pages_path(prototype)
  end
end
