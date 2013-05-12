class PrototypesController < ApplicationController
  
  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find_by_permalink!(params[:id]) if params[:id]
  end

end
