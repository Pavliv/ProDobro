class CommentsController < ApplicationController
  def index
    @commentable = News.find(params[:news_id])
    @comments = @commentable.comments
  end

  def new
  end
end
