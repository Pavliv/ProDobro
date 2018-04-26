class ImagesController < ApplicationController
  before_action :load_image
  before_action :set_imag, only: %i[show edit update destroy]

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to :action => :show, :id => @image.id
    else
      render 'new'
    end
  end

   
  def edit; end

  
  # def destroy
  #   if @image.destroy
  #     flash.alert = t('.news_deleted')
  #     redirect_to @commentable
  #   else
  #     flash.alert = t('.news.notdeleted')
  #   end
  # end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
