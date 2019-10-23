class CurriculumController < ApplicationController

  def index
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

end
