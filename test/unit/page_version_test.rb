require 'test_helper'

class PageVersionTest < ActiveSupport::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:page_version){ page.page_versions.first }
  
  test "#current? should compare its self to the current on the page" do
    page_version.current?.must_equal(true)
    page_version.page.page_versions.create! image: File.open(test_image_file)
    page_version.current?.must_equal(false)
  end
  
end
