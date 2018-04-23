class NewsController < ApplicationController
  before_action :load_news, only: %i[show edit update destroy]

  def index
    @news = News.order(:created_at).page(params[:page])
  end

  def show; end

  def new
    @news = News.new
  end

  def edit; end

  def create
    @news = current_user.news.new(news_params)
    if @news.save
      redirect_to action: 'index'
      flash[:notice] = t('.news_created')
    else
      render 'new'
      flash[:alert] = t('.news_notcreated')
    end
  end

  def update
    if @news.update(news_params)
      flash[:notice] = t('.news_updated')
      redirect_to action: 'index'
    else
      flash[:alert] = t('.news_notupdated')
      render 'edit'
    end
  end

  def destroy
    if @news.destroy
      flash[:notice] = t('.news_deleted')
      redirect_to action: 'index'
    else
      flash[:alert] = t('.news.notdeleted')
    end
  end

  private

  def load_news
    @news = News.find_by(id: params[:id]) || render_404
  end

  def news_params
    params.require(:news).permit(:title, :description)
  end
end
