class CampaignsController < ApplicationController
  layout 'admin'

  def index
    @campaigns = Campaign.all.order(:sort)
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:success] = 'Campaign Create success!'
      redirect_to edit_admin_contents_campaign_url(id: @campaign.id) and return
    end
    @errors = @campaign.errors
    flash[:error] = "We're sorry, we cannot create the campaign at the moment"
    render template: 'campaigns/new'
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      flash[:success] = 'Campaign Update success!'
      redirect_to edit_admin_contents_campaign_url and return
    end
    @errors = @campaign.errors
    flash[:error] = "We're sorry, we cannot update the campaign at the moment"
    render template: 'campaigns/edit'
  end
  
  def destroy
    Campaign.find(params[:id]).destroy
    redirect_to admin_contents_campaigns_url
  end
  
  def sort
    Campaign.sort!(params[:campaign][:sort])
    flash[:success] = 'Campaign Sort success!'
    redirect_to admin_contents_campaigns_url
  end
  
  protected
    
    def campaign_params
      params.require(:campaign).permit!
    end
end
