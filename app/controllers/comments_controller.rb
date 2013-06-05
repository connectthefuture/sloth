class CommentsController < ApplicationController
  before_filter :set_objects
  
  def create
    respond_to do |wants|
      wants.js do
        @comment = @page_version.comments.build(params[:comment].merge(user: current_user))

        if @comment.save
          flash.now[:notice] = "Comment saved successfully"
          @comment = nil
        end
      end
    end
  end
  
  private

  def set_objects
    @prototype = Prototype.find_by_permalink!(params[:prototype_id])
    @page = @prototype.pages.find(params[:page_id])
    @page_version = @page.page_versions.find(params[:page_version_id])
    @comment = @page_version.comments.find(params[:id]) if params[:id]
  end
end
