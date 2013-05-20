require 'test_helper'

class PageVersionTest < ActiveSupport::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:page_version){ page.page_versions.first }
  
  test "#current? should compare its self to the current on the page" do
    page_version.current?.must_equal(true)
    page_version.page.page_versions.create! image: File.open(test_image_file)
    page_version.current?.must_equal(false)
  end
  
  test "#copy_links_from_previous_version should copy in the links as expected" do
    link = FactoryGirl.create(:link, page_version: page_version)
    new_page_version = page.page_versions.create! image: File.open(test_image_file)
    
    new_page_version.links.size.must_equal(1)
    [:pos_x, :pos_y, :width, :height].each do |attribute|
      new_page_version.links.first.send(attribute).must_equal(link.send(attribute))
    end
  end
  
  test "#previous_version should look up its previous version" do 
    second_page_version = page.page_versions.create! image: File.open(test_image_file)
    
    second_page_version.previous_version.must_equal(page_version)
    page_version.previous_version.must_equal(nil)
  end
  
end
