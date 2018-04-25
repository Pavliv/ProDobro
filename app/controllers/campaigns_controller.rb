class CampaignsController < ApplicationController
  before_action :load_campaign, only: %i[show edit update destroy]
  before_action :load_commentable, only: %i[show]

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

  private

  def load_campaign
    @campaign = Campaign.find_by(id: params[:id]) || render_404
  end

  def campaigns_params
    params.require(:campaign).permit(:title, :description, :needed_amount,
                                     :requisite, :created_at, :updated_at)
  end
end
