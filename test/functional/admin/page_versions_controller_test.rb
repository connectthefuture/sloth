require 'test_helper'

class Admin::PageVersionsControllerTest < ActionController::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:prototype){ page.prototype }
  let(:page_version){ page.page_version }

  setup do
    login
  end
  
  test "should get index" do
    get :index, prototype_id: prototype.permalink, page_id: page.id
    assert_response :success
    assert_not_nil assigns(:page_versions)
  end

  test "should get new" do
    get :new, prototype_id: prototype.permalink, page_id: page.id
    assert_response :success
  end
  
  test "should create page" do
    assert_difference('Page.count') do
      post :create, page_version: { image: test_image_rack_upload }, prototype_id: prototype.permalink, page_id: page.id
    end

    assert_redirected_to admin_prototype_page_path(prototype, assigns(:page))
  end
end
