require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  before(:each) { sign_in user }

  describe 'news comments' do
    let(:news) { create(:news, user: user) }
    let(:comment) { create(:news_valid_comment, user: user, commentable: news) }

    describe 'POST #create' do
      context 'when comment is valid' do
        before do
          post :create, params: {
            locale: 'en',
            news_id: news.id,
            comment: attributes_for(:news_valid_comment)
          }
        end

        it 'creates a comment' do
          expect(Comment.find_by(body: comment[:body])).to be_present
        end

        it { is_expected.to redirect_to(news_path(news)) }

        it { is_expected.to set_flash }
      end

      context 'when comment is invalid' do
        it 'redirects on news show page' do
          post :create, params: {
            locale: 'en',
            news_id: news.id,
            comment: attributes_for(:news_invalid_comment)
          }
          is_expected.to redirect_to(news_path(news))
        end
      end
    end

    describe 'GET #edit' do
      context 'user signed out' do
        it 'redirects to sign_in page' do
          sign_out user
          get :edit, params: {
            locale: 'en',
            id: comment.id,
            news_id: news.id,
            comment: attributes_for(:news_invalid_comment)
          }
          is_expected.to redirect_to('http://test.host/users/sign_in')
        end
      end

      context 'when comment not found' do
        it 'renders page 404' do
          get :edit, params: { locale: 'en', id: 0, news_id: news.id }
          is_expected.to render_template(file: "#{Rails.root}/public/404.html")
        end
      end
    end

    describe 'PUT #update' do
      let(:valid_data) { Faker::Lorem.characters(3) }
      let(:invalid_data) { '' }

      context 'when comment is valid' do
        before do
          put :update, params: {
            locale: 'en',
            id: comment.id,
            news_id: news.id,
            comment: attributes_for(:news_valid_comment, body: valid_data)
          }
        end

        it 'updates the campaign' do
          expect(Comment.find(comment.id).body).to eq(valid_data)
        end

        it { is_expected.to redirect_to(news_path(news)) }

        it { is_expected.to set_flash }
      end

      context 'when campaing is invalid' do
        it 'can not update campaign' do
          put :update, params: {
            locale: 'en',
            id: comment.id,
            news_id: news.id,
            comment: attributes_for(:news_valid_comment, body: invalid_data)
          }
          is_expected.to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'when campaign is valid' do
        before do
          delete :destroy, params: { locale: 'en', id: comment.id, news_id: news.id }
        end

        it 'deletes the campaign' do
          expect(Comment.find_by(id: comment.id)).to eq(nil)
        end

        it { is_expected.to redirect_to(news_path(news)) }

        it { is_expected.to set_flash }
      end

      context 'when comment not found' do
        it 'renders page 404' do
          delete :destroy, params: { locale: 'en', id: 0, news_id: news.id }
          is_expected.to render_template(file: "#{Rails.root}/public/404.html")
        end
      end
    end
  end

  describe 'campaign comments' do
    let(:campaign) { create(:valid_campaign, user: user) }
    let(:comment) { create(:campaign_valid_comment, user: user, commentable: campaign) }

    describe 'POST #create' do
      context 'when comment is valid' do
        before do
          post :create, params: {
            locale: 'en',
            campaign_id: campaign.id,
            comment: attributes_for(:campaign_valid_comment)
          }
        end

        it 'creates a comment' do
          expect(Comment.find_by(body: comment[:body])).to be_present
        end

        it { is_expected.to redirect_to(campaign_path(campaign)) }

        it { is_expected.to set_flash }
      end

      context 'when comment is invalid' do
        it 'redirects on campaign show page' do
          post :create, params: {
            locale: 'en',
            campaign_id: campaign.id,
            comment: attributes_for(:campaign_invalid_comment)
          }
          is_expected.to redirect_to(campaign_path(campaign))
        end
      end
    end

    describe 'GET #edit' do
      context 'user signed out' do
        it 'redirects to sign_in page' do
          sign_out user
          get :edit, params: {
            locale: 'en',
            id: comment.id,
            campaign_id: campaign.id,
            comment: attributes_for(:campaign_invalid_comment)
          }
          is_expected.to redirect_to('http://test.host/users/sign_in')
        end
      end

      context 'when comment not found' do
        it 'renders page 404' do
          get :edit, params: { locale: 'en', id: 0, campaign_id: campaign.id }
          is_expected.to render_template(file: "#{Rails.root}/public/404.html")
        end
      end
    end

    describe 'PUT #update' do
      let(:valid_data) { Faker::Lorem.characters(3) }
      let(:invalid_data) { '' }

      context 'when comment is valid' do
        before do
          put :update, params: {
            locale: 'en',
            id: comment.id,
            campaign_id: campaign.id,
            comment: attributes_for(:campaign_valid_comment, body: valid_data)
          }
        end

        it 'updates the campaign' do
          expect(Comment.find(comment.id).body).to eq(valid_data)
        end

        it { is_expected.to redirect_to(campaign_path(campaign)) }

        it { is_expected.to set_flash }
      end

      context 'when campaing is invalid' do
        it 'can not update campaign' do
          put :update, params: {
            locale: 'en',
            id: comment.id,
            campaign_id: campaign.id,
            comment: attributes_for(:campaign_valid_comment, body: invalid_data)
          }
          is_expected.to render_template(:edit)
        end
      end
    end

    describe 'DELETE #destroy' do
      context 'when campaign is valid' do
        before do
          delete :destroy, params: { locale: 'en', id: comment.id, campaign_id: campaign.id }
        end

        it 'deletes the campaign' do
          expect(Comment.find_by(id: comment.id)).to eq(nil)
        end

        it { is_expected.to redirect_to(campaign_path(campaign)) }

        it { is_expected.to set_flash }
      end

      context 'when comment not found' do
        it 'renders page 404' do
          delete :destroy, params: { locale: 'en', id: 0, campaign_id: campaign.id }
          is_expected.to render_template(file: "#{Rails.root}/public/404.html")
        end
      end
    end
  end
end
