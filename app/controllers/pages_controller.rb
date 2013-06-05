class PagesController < ApplicationController
  before_filter :set_objects

  def index
    @pages = @prototype.pages
  end

  def show
  end

  def new
    @page = @prototype.pages.build
    @page.page_versions.build
  end

  def edit
  end

  def create
    @page = @prototype.pages.build(params[:page])

    if @page.save
      redirect_to [@prototype, @page], notice: 'Page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to [@prototype, @page], notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @page.destroy

    redirect_to prototype_pages_path
  end

  private

  def set_objects
    @prototype = Prototype.find_by_permalink!(params[:prototype_id])
    @page = @prototype.pages.find(params[:id]) if params[:id]
    @page_version = @page.current_version if @page
  end
end
