require 'rails_helper'

RSpec.describe NewsController, type: :controller do
<<<<<<< HEAD
  let(:news) { create(:valid_news) }

  describe 'GET #index' do
    it 'renders index template' do
      get :index
      is_expected.to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders new template' do
      get :new
      is_expected.to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'renders show template' do
      get :show, params: { id: news.id }
      is_expected.to render_template(:show)
    end

    context 'when news not found' do
      it 'renders page 404' do
        get :show, params: { id: -1 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end

  describe 'GET #edit' do
    context 'when news not found' do
      it 'renders page 404' do
        get :edit, params: { id: -1 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:valid_news_attributes) { attributes_for(:valid_news) }

    before(:each) do
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'when news is valid' do
      before do
        put :create, params: { news: attributes_for(:valid_news) }
      end

      it 'creates new news' do
        expect(News.pluck(:title, :description).last).to eq(valid_news_attributes.values)
      end

      it { is_expected.to redirect_to(action: :index) }

      it { is_expected.to set_flash }
    end

    context 'when news is invalid' do
      it 'renders new template' do
        post :create, params: { news: attributes_for(:invalid_news) }
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    let(:char2) { Faker::Lorem.characters(2) }
    let(:char3) { Faker::Lorem.characters(3) }

    context 'when news is valid' do
      before do
        put :update, params: {
          id: news.id,
          news: attributes_for(:valid_news, title: char3)
        }
      end

      it 'updates news' do
        expect(News.find(news.id).title).to eq(char3)
      end

      it { is_expected.to redirect_to(action: :index) }

      it { is_expected.to set_flash }
    end

    context 'when news is invalid' do
      it 'can not change news' do
        put :update, params: { id: news.id, news: attributes_for(:valid_news, title: char2) }
        is_expected.to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:news) { create(:news) }

    context 'when news is valid' do
      before do
        delete :destroy, params: { id: news.id }
      end

      it { is_expected.to redirect_to(action: :index) }

      it 'deletes the news' do
        expect(News.find_by(id: news.id)).to eq(nil)
      end

      it { is_expected.to set_flash }
    end

    context 'when news not found' do
      it 'renders page 404' do
        delete :destroy, params: { id: 0 }
        is_expected.to render_template(file: "#{Rails.root}/public/404.html")
      end
    end
  end
=======

>>>>>>> Rebase
end
