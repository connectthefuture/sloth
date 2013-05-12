class PagesController < ApplicationController
  before_filter :set_objects

  def index
    @pages = @prototype.pages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  def new
    @page = @prototype.pages.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  def edit
  end

  def create
    @page = @prototype.pages.build(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to [@prototype, @page], notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to [@prototype, @page], notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy

    respond_to do |format|
      format.html { redirect_to prototype_pages_url }
      format.json { head :no_content }
    end
  end

  private

  def set_objects
    @prototype = Prototype.find(params[:prototype_id])
    @page = @prototype.pages.find(params[:id]) if params[:id]
  end
end
