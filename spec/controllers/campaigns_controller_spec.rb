require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  let(:campaign) { create(:valid_campaign) }

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      is_expected.to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders show template' do
      get :show, params: { locale: 'en', id: campaign.id }
      is_expected.to render_template(:show)
    end

    context 'when campaign not found' do
      it 'renders page 404' do
        get :show, params: { id: 0 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end

  describe 'GET #new' do
    it 'renders new template' do
      get :new
      is_expected.to render_template(:new)
    end
  end

  describe 'GET #edit' do
    context 'when campaign not found' do
      it 'renders page 404' do
        get :edit, params: { id: 0 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:valid_campaign_attributes) { attributes_for(:valid_campaign) }
    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'when campaign is valid' do
      before do
        post :create, params: { campaign: valid_campaign_attributes }
      end

      it 'creates a campaign' do
        expect(Campaign.find_by(title: valid_campaign_attributes[:title])).to be_present
      end

      it { is_expected.to redirect_to(action: :index) }

      it { is_expected.to set_flash }
    end

    context 'when campaing is invalid' do
      it 'renders new template' do
        post :create, params: { campaign: attributes_for(:invalid_campaign) }
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:valid_data) { Faker::Lorem.characters(3) }
    let(:invalid_data) { Faker::Lorem.characters(1) }

    context 'when campaign is valid' do
      before do
        put :update, params: {
          id: campaign.id,
          campaign: attributes_for(:valid_campaign, title: valid_data)
        }
      end

      it 'updates the campaign' do
        expect(Campaign.find(campaign.id).title).to eq(valid_data)
      end

      it { is_expected.to redirect_to(action: :index) }

      it { is_expected.to set_flash }
    end

    context 'when campaing is invalid' do
      it 'can not update campaign' do
        put :update, params: {
          id: campaign.id,
          campaign: attributes_for(:valid_campaign, title: invalid_data)
        }
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when campaign is valid' do
      before do
        delete :destroy, params: { id: campaign.id }
      end

      it 'deletes the campaign' do
        expect(Campaign.find_by(id: campaign.id)).to eq(nil)
      end

      it { is_expected.to redirect_to(action: :index) }

      it { is_expected.to set_flash }
    end

    context 'when campaign not found' do
      it 'renders page 404' do
        delete :destroy, params: { id: 0 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end
end
