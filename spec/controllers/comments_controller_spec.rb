require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:news) { create(:news, user: user) }
    let(:comment) {create(:comment , user: user, commentable: news)}
   
    context 'when comment is valid' do
      before do 
        post :create, params: { news_id: news.id, comment: attributes_for(:valid_comment) }
      end

      it 'creates a comment' do
        expect(Comment.find_by(body: comment[:body])).to be_present
      end

      it { is_expected.to redirect_to(news_path(news)) }

      it { is_expected.to set_flash }
    end

    context 'when comment is invalid' do
      it 'redirects on news show page' do
        post :create, params: { news_id: news.id, comment: attributes_for(:invalid_comment) }
        is_expected.to redirect_to(news_path(news))
      end
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }
    let(:news) { create(:news, user: user) }
    context 'when comment not found' do
      it 'renders page 404' do
        get :edit, params: { id: 0, news_id: news.id }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end

  describe 'PUT #update' do
    let(:user) { create(:user) }
    let(:news) { create(:news, user: user) }
    let(:comment) {create(:comment , user: user, commentable: news)}
    let(:valid_data) { Faker::Lorem.characters(3) }
    let(:invalid_data) { '' }

    context 'when comment is valid' do
      before do
        put :update, params: {
          id: comment.id,
          news_id: news.id, 
          comment: attributes_for(:valid_comment, body: valid_data)
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
          id: comment.id,
          news_id: news.id, 
          comment: attributes_for(:valid_comment, body: invalid_data)
        }
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }
    let(:news) { create(:news, user: user) }
    let(:comment) {create(:comment , user: user, commentable: news)}
    context 'when campaign is valid' do
      before do
        delete :destroy, params: { id: comment.id, news_id: news.id }
      end

      it 'deletes the campaign' do
        expect(Comment.find_by(id: comment.id)).to eq(nil)
      end

      it { is_expected.to redirect_to(news_path(news)) }

      it { is_expected.to set_flash }
    end
    context 'when comment not found' do
      it 'renders page 404' do
        delete :destroy, params: { id: 0, news_id: news.id}
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end
end
