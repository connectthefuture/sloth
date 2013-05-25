require 'test_helper'

class PrototypeTest < ActiveSupport::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:prototype){ page.prototype }
  
  describe "#default_image" do
    test "it should handle when the prototype has no pages" do
      prototype.pages.destroy_all
      prototype.default_image.must_equal(nil)
    end
    
    test "it should get the image off the page" do
      prototype.default_image.to_s.must_equal(page.page_versions.first.image.to_s)
    end
  end
end
