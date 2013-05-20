require 'test_helper'

class PageTest < ActiveSupport::TestCase
  let(:page){ FactoryGirl.create(:page) }
  
  test "#current_version should get the right version" do
    highest_version = page.page_versions.build image: File.open(test_image_file)
    page.save!
    page.reload
    page.current_version.must_equal(highest_version)
  end
  
  test "#current_version should deal with an empty set" do
    page.page_versions.destroy_all
    page.current_version.must_be_nil
  end
  
end
