class HealthsController < ApplicationController
  layout 'admin'

  before_filter :admin_authorize
  before_filter :validate_admin_permission

  def index
    @healths = Health.all
  end
  
  def new
    @health = Health.new
  end
  
  def create
    @health = Health.new(health_params)
    if @health.save
      flash[:success] = 'Health Create success!'
      redirect_to edit_admin_contents_health_url(id: @health.id) and return
    end
    @errors = @health.errors
    flash[:error] = "We're sorry, we cannot create the health at the moment"
    render template: 'healths/new'
  end
  
  def edit
    @health = Health.find(params[:id])
  end

  def update
    @health = Health.find(params[:id])
    if @health.update_attributes(health_params)
      flash[:success] = 'Health Update success!'
      redirect_to edit_admin_contents_health_url and return
    end
    @errors = @health.errors
    flash[:error] = "We're sorry, we cannot update the health at the moment"
    render template: 'healths/edit'
  end
  
  def destroy
    Health.find(params[:id]).destroy
    redirect_to admin_contents_healths_url
  end
    
  protected
    
    def health_params
      params.require(:health).permit!
    end
end
