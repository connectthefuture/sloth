class Admin::PrototypesController < ApplicationController
  before_filter :set_objects

  def index
    @prototypes = Prototype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prototypes }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prototype }
    end
  end

  def new
    @prototype = Prototype.new

    respond_to do |format| 
      format.html # new.html.erb
      format.json { render json: @prototype }
    end
  end

  def edit
  end

  def create
    @prototype = Prototype.new(params[:prototype])
    @prototype.user_id = session[:user_id]

    respond_to do |format|
      if @prototype.save
        format.html { redirect_to [:admin, @prototype], notice: 'Prototype was successfully created.' }
        format.json { render json: @prototype, status: :created, location: @prototype }
      else
        format.html { render action: "new" }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prototype.update_attributes(params[:prototype])
        format.html { redirect_to [:admin, @prototype], notice: 'Prototype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @prototype.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prototype.destroy

    respond_to do |format|
      format.html { redirect_to admin_prototypes_path }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_objects
    @prototype = Prototype.find_by_permalink!(params[:id]) if params[:id]
  end
end
