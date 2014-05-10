class SectionsController < ApplicationController
  
  before_action :confirm_logged_in

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created succesfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section update succesfully"
      redirect_to(:action => 'show', :id => @section.id)
    else
    render('edit')
    end  
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy 
    flash[:notice] = "Section deleted succesfully" 
    redirect_to(:action => 'index')
  end

  private
  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
  
end
