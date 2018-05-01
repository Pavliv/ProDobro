class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :load_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create edit destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = t('.comment.created')
    else
      flash[:alert] = t('.comment.not_created')
    end
    redirect_to @commentable
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash.alert = t('.comment.updated')
      redirect_to @commentable
    else
      flash.alert = t('.comment.not_updated')
      render 'edit'
    end
  end

  def destroy
    if @comment.destroy
      flash.alert = t('.comment.deleted')
      redirect_to @commentable
    else
      flash.alert = t('.comment.not_deleted')
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[2, 3]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def load_comment
    @comment = @commentable.comments.find_by(id: params[:id]) || render_404
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
