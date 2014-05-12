class SectionsController < ApplicationController
  
  layout "admin"
  before_action :confirm_logged_in
  before_action :find_page

  def index
    @sections = @page.sections.sorted
    #@sections = Section.where(:page_id => @page.id).sorted
    #@sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    # @section = Section.new({:name => "Default"})
     @section = Section.new({:page_id => @page.id, :name => "Default"})
     @pages = @page.subject.pages.sorted
     @section_count = Section.count + 1
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

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end
  end
  
end
