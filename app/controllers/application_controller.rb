class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def load_commentable
    request_path = request.path.split('/')
    if request_path[1] == 'uk' || request_path[1] == 'en'
      resource, id = request_path[2, 3]
    else
      resource, id = request_path[1, 3]
    end
    @commentable = resource.singularize.classify.constantize.find(id)
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
    end
  end
end
