class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only:[:show, :new]
  def index
    @curriculums = Curriculum.where(ancestry: nil)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def new
    @curriculum = Curriculum.where(ancestry: nil)
  end

  # def edit
  #   @curriculum = Curriculum.find(params[:id])
  # end

  # def update
  #   @curriculum = Curriculum.find(params[:id])
  #   @curriculum.update(drill_update_params)
  #   render action: "edit"
  # end

  # def drill_update_params
  #   params.require(:curriculum).permit!
  # end
end
