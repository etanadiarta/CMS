class SubjectsController < ApplicationController
 
  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    #Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    #Save the project
    if @subject.save
    #If ave succeds, redirect to the index action
      flash[:notice] = "Subject created succesfully"
      redirect_to(:action => 'index')
    else
    #If save fails, redisplay the form so user can fix problems
    @subject_count = Subject.count + 1
    render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    #Find an exixting object using form parameters
    @subject = Subject.find(params[:id])
    #Update the project
    if @subject.update_attributes(subject_params)
    #If update succeds, redirect to the index action
      flash[:notice] = "Subject update succesfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
    #If update fails, redisplay the form so user can fix problems
    @subject_count = Subject.count
    render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end
  
  def destroy
    subject = Subject.find(params[:id]).destroy 
    flash[:notice] = "Subject '#{subject.name}' deleted succesfully" 
    redirect_to(:action => 'index')
  end 

  private
  def subject_params
    #same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:subject).permit(:name, :position, :visible)
  end
  
end