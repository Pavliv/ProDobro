class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :set_comment, only: %i[show edit update destroy]

  # def new
  # @comment = @commentable.comments.new
  # end

  def create
    @comment = @commentable.comments.new(allowed_params)
    if @comment.save
      flash[:notice] = 'Created'
      redirect_to @commentable
    else
      flash[:alert] = t('.didn_t_create')
      redirect_to @commentable
    end
  end

  def edit; end

  def update
    if @comment.update(allowed_params)
      flash.alert = t('.comment updated')
      redirect_to @commentable
    else
      flash.alert = t('.news_notupdated')
      render 'edit'
    end
  end

  def destroy
    if @comment.destroy
      flash.alert = t('.news_deleted')
      redirect_to @commentable
    else
      flash.alert = t('.news.notdeleted')
    end
  end

  private
  def set_comment
    @comment = @commentable.comments.find_by(id: params[:id]) || render_404
  end
 
  def load_commentable
    resource, id = request.path.split('/')[1,3]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def allowed_params
    params.require(:comment).permit(:body, :user_id)
  end

end
