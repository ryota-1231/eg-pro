class ImageController < ApplicationController

  def index

  end

  def create
    Image.create(image: params[:image])
  end
    
end
