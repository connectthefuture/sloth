require 'test_helper'

class Admin::PageVersionsControllerTest < ActionController::TestCase
  let(:page){ FactoryGirl.create(:page) }
  let(:prototype){ page.prototype }
  let(:page_version){ page.page_version }

  setup do
    login
  end
  
   
end
