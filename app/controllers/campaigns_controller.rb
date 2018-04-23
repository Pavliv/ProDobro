class CampaignsController < ApplicationController
  before_action :load_campaign, only: %i[show edit update destroy publish hold close]

  def index
    @campaigns = Campaign.all
  end

  def show; end

  def new
    @campaign = Campaign.new
  end

  def edit; end

  def create
    @campaign = current_user.campaigns.new(campaigns_params)
    if @campaign.save
      flash[:notice] = t('.successfully_create')
      redirect_to action: 'index'
    else
      flash[:alert] = t('.didn_t_create')
      render 'new'
    end
  end

  def update
    if @campaign.update(campaigns_params)
      flash[:notice] = t('.successfully_update')
      redirect_to action: 'index'
    else
      flash[:alert] = t('.didn_t_update')
      render 'edit'
    end
  end

  def destroy
    if @campaign.destroy
      flash[:notice] = t('.successfully_deleted')
      redirect_to action: 'index'
    else
      flash[:alert] = t('.didn_t_delete')
    end
  end

  def publish
    redirect_to campaigns_path if @campaign.publish!
    flash[:notice] = t('.successfully_published')
  end

  def hold
    redirect_to campaigns_path if @campaign.hold!
    flash[:notice] = t('.successfully_hold_on')
  end

  def close
    redirect_to campaigns_path if @campaign.close!
    flash[:notice] = t('.successfully_closed')
  end

  private

  def load_campaign
    @campaign = Campaign.find_by(id: params[:id]) || render_404
  end

  def campaigns_params
    params.require(:campaign).permit(:title, :description, :needed_amount,
                                     :requisite)
  end
end
