require "test_helper"

class CommentTest < ActiveSupport::TestCase
  let(:comment){ FactoryGirl.create(:comment) }
  
  describe "#annotation?" do
    test "should check for the presence of a coordinate" do
      comment.annotation?.must_equal(false)
      FactoryGirl.create(:comment_with_annotation).annotation?.must_equal(true)
    end
  end

end
