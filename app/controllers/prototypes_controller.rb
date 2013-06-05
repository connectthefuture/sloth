class PrototypesController < ApplicationController
  before_filter :set_objects

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def edit
  end

  def create
    @prototype = Prototype.new(params[:prototype])
    @prototype.user_id = session[:user_id]

    if @prototype.save
      redirect_to prototypes_path, notice: 'Prototype was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @prototype.update_attributes(params[:prototype])
      redirect_to prototypes_path, notice: 'Prototype was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @prototype.destroy

    redirect_to prototypes_path
  end
  
  private
  
  def set_objects
    @prototype = Prototype.find_by_permalink!(params[:id]) if params[:id]
  end
end
