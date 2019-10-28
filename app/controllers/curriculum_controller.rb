class CurriculumController < ApplicationController

  def index
    @HTML = Curriculum.find(1)
    @Ruby = Curriculum.find(2)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def new
  end

  def frame
    render layout: false
  end

  def iframe
    render layout: false
  end
end
