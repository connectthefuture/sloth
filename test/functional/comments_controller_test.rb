require "test_helper"

class CommentsControllerTest < ActionController::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:prototype){ page.prototype }
  let(:page_version){ page.page_versions.first }

  setup do
    @user = login
  end

  test "create should create a comment successfully" do
    Comment.all.size.must_equal(0)
    
    post :create, prototype_id: prototype.permalink, page_id: page.id, page_version_id: page_version.id, comment: {body: "test"}, format: "js"
    comment = Comment.all.first
    
    Comment.all.size.must_equal(1)
    comment.user.must_equal(@user)
    assigns(:comment).must_be_nil
  end

  test "create should fail to create a comment" do
    Comment.all.size.must_equal(0)
    post :create, prototype_id: prototype.permalink, page_id: page.id, page_version_id: page_version.id, comment: {body: ""}, format: "js"
    Comment.all.size.must_equal(0)
    assigns(:comment).wont_be_nil
  end
  
end
